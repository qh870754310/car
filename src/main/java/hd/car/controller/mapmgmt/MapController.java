package hd.car.controller.mapmgmt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import hd.car.service.carmgmt.ArchivesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 地图控制器
 * Created by jumpa on 2018/10/29 14:27.
 */
@Controller
@RequestMapping("/map")
public class MapController {

    private final ArchivesService archivesService;

    @Autowired
    public MapController(ArchivesService archivesService) {
        this.archivesService = archivesService;
    }

    /**
     * 地图页面
     *
     * @return 视图
     */
    @GetMapping("/view")
    public String mapView(Model model) {
        Map map = new HashMap();
        List<Map> Archives = archivesService.getAllArchives(map);
        model.addAttribute("Archives", JSON.toJSON(Archives));
        return "map_mgmt/map";
    }


    @GetMapping("/historyTracksView")
    public String historyTracksView(String id, Model model) {
        model.addAttribute("carId", id);
        return "map_mgmt/history_tracks";
    }

    @GetMapping("/getHistoryTracksPoint")
    @ResponseBody
    public JSONObject getHistoryTracksPoint(String id, String startDate, String endDate) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        JSONObject jsonObject = new JSONObject();
        try {
            List<Map> tracksPoint = archivesService.getHistoryTracksPoint(map);
            jsonObject.put("tracksPoint", JSON.toJSON(tracksPoint));
            jsonObject.put("state", true);
        } catch (Exception e) {
            jsonObject.put("state", false);
        }
        return jsonObject;
    }
}
