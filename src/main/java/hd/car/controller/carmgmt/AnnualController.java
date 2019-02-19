package hd.car.controller.carmgmt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Annual;
import hd.car.service.carmgmt.AnnualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 年检记录控制器
 * Created by jumpa on 2018/10/29 16:14.
 */
@Controller
@RequestMapping("/annual")
public class AnnualController {
    private final AnnualService annualService;

    @Autowired
    public AnnualController(AnnualService annualService) {
        this.annualService = annualService;
    }

    @GetMapping("/list")
    public String listView(String menuId, Model model) {
        return "car_mgmt/annual/list";
    }

    @ResponseBody
    @RequestMapping("/getDataGrid")
    public Map<String, Object> getDataGrid(QueryParam param) {
        return annualService.getDataGrid(param);
    }

    @GetMapping("/form")
    public String formView(String id, Model model) {
        if (id == null) {//新增
            model.addAttribute("category", 1);
            model.addAttribute("formData", new JSONObject());
        } else {//编辑
            model.addAttribute("category", 2);
            model.addAttribute("formData", JSON.toJSON(annualService.getById(id)));
        }
        return "car_mgmt/annual/form";
    }

    @ResponseBody
    @PostMapping("/subForm")
    public Map<String, Boolean> subForm(Annual annual) {
        Map<String, Boolean> result = new HashMap<>();
        try {
            if (annual.getId() == null) {//新增
                annualService.add(annual);
            } else {//编辑
                annualService.modify(annual);
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
            annualService.del(id);
            result.put("state", true);
        } catch (Exception e) {
            result.put("state", false);
        }
        return result;
    }
}
