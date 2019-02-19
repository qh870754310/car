package hd.car.controller.carmgmt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Oiling;
import hd.car.service.carmgmt.OilingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 加油记录控制器
 * Created by jumpa on 2018/10/29 16:16.
 */
@Controller
@RequestMapping("/oiling")
public class OilingController {
    private final OilingService oilingService;

    @Autowired
    public OilingController(OilingService oilingService) {
        this.oilingService = oilingService;
    }

    @GetMapping("/list")
    public String listView(String menuId, Model model) {
        return "car_mgmt/oiling/list";
    }

    @ResponseBody
    @RequestMapping("/getDataGrid")
    public Map<String, Object> getDataGrid(QueryParam param) {
        return oilingService.getDataGrid(param);
    }

    @GetMapping("/form")
    public String formView(String id, Model model) {
        if (id == null) {//新增
            model.addAttribute("category", 1);
            model.addAttribute("formData", new JSONObject());
        } else {//编辑
            model.addAttribute("category", 2);
            model.addAttribute("formData", JSON.toJSON(oilingService.getById(id)));
        }
        return "car_mgmt/oiling/form";
    }

    @ResponseBody
    @PostMapping("/subForm")
    public Map<String, Boolean> subForm(Oiling oiling) {
        Map<String, Boolean> result = new HashMap<>();
        try {
            if (oiling.getId() == null) {//新增
                oilingService.add(oiling);
            } else {//编辑
                oilingService.modify(oiling);
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
            oilingService.del(id);
            result.put("state", true);
        } catch (Exception e) {
            result.put("state", false);
        }
        return result;
    }
}
