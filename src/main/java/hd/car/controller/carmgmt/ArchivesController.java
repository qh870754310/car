package hd.car.controller.carmgmt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Archives;
import hd.car.service.carmgmt.ArchivesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 车辆档案控制器
 * Created by jumpa on 2018/10/29 16:12.
 */
@Controller
@RequestMapping("/archives")
public class ArchivesController {
    private final ArchivesService archivesService;

    @Autowired
    public ArchivesController(ArchivesService archivesService) {
        this.archivesService = archivesService;
    }

    @GetMapping("/list")
    public String listView(String menuId, Model model) {
        return "car_mgmt/archives/list";
    }

    @ResponseBody
    @RequestMapping("/getDataGrid")
    public Map<String, Object> getDataGrid(QueryParam param) {
        return archivesService.getDataGrid(param);
    }

    @GetMapping("/form")
    public String formView(String id, Model model) {
        if (id == null) {//新增
            model.addAttribute("category", 1);
            model.addAttribute("formData", new JSONObject());
        } else {//编辑
            model.addAttribute("category", 2);
            model.addAttribute("formData", JSON.toJSON(archivesService.getById(id)));
        }
        return "car_mgmt/archives/form";
    }

    @ResponseBody
    @RequestMapping("/verifyLisence/{license}")
    public Map<String, Boolean> verifyLisence(@PathVariable("license") String license) {
        return archivesService.verifyLicense(license);
    }

    @ResponseBody
    @PostMapping("/subForm")
    public Map<String, Boolean> subForm(Archives archives) {
        Map<String, Boolean> result = new HashMap<>();
        try {
            if (archives.getId() == null) {//新增
                archivesService.add(archives);
            } else {//编辑
                archivesService.modify(archives);
            }
            result.put("state", true);
        } catch (Exception e) {
            result.put("state", false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/del/{id}")
    public Map<String, Boolean> delCountry(@PathVariable("id") String id) {
        Map<String, Boolean> result = new HashMap<>();
        try {
            archivesService.del(id);
            result.put("state", true);
        } catch (Exception e) {
            result.put("state", false);
        }
        return result;
    }
}
