package hd.car.controller.carmgmt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Insurance;
import hd.car.service.carmgmt.InsuranceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 保险记录控制器
 * Created by jumpa on 2018/10/29 16:14.
 */
@Controller
@RequestMapping("/insurance")
public class InsuranceController {
    private final InsuranceService insuranceService;

    @Autowired
    public InsuranceController(InsuranceService insuranceService) {
        this.insuranceService = insuranceService;
    }

    @GetMapping("/list")
    public String listView(String menuId, Model model) {
        return "car_mgmt/insurance/list";
    }

    @ResponseBody
    @RequestMapping("/getDataGrid")
    public Map<String, Object> getDataGrid(QueryParam param) {
        return insuranceService.getDataGrid(param);
    }

    @GetMapping("/form")
    public String formView(String id, Model model) {
        if (id == null) {//新增
            model.addAttribute("category", 1);
            model.addAttribute("formData", new JSONObject());
        } else {//编辑
            model.addAttribute("category", 2);
            model.addAttribute("formData", JSON.toJSON(insuranceService.getById(id)));
        }
        return "car_mgmt/insurance/form";
    }

    @ResponseBody
    @PostMapping("/subForm")
    public Map<String, Boolean> subForm(Insurance insurance) {
        Map<String, Boolean> result = new HashMap<>();
        try {
            if (insurance.getId() == null) {//新增
                insuranceService.add(insurance);
            } else {//编辑
                insuranceService.modify(insurance);
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
            insuranceService.del(id);
            result.put("state", true);
        } catch (Exception e) {
            result.put("state", false);
        }
        return result;
    }
}
