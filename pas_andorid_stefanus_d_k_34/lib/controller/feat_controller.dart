import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/team_model.dart';

class FeatController extends GetxController {
  static const String _url =
      'https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League';

  RxList<Team> listTeam = <Team>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getTeams();
  }

  Future<void> getTeams() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http
          .get(Uri.parse(_url))
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final model = premierLeagueModelFromJson(response.body);
        listTeam.assignAll(model.teams);
      } else {
        errorMessage.value = 'Gagal memuat data (kode ${response.statusCode})';
      }
    } catch (e) {
      errorMessage.value = 'Gagal memuat data. Periksa koneksi internet.';
    } finally {
      isLoading.value = false;
    }
  }
}
