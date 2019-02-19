package hd.car.controller.carmgmt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Archives;
import hd.car.model.carmgmt.Maintain;
import hd.car.service.carmgmt.MaintainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 维修记录控制器
 * Created by jumpa on 2018/10/29 16:13.
 */
@Controller
@RequestMapping("/maintain")
public class MaintainController {
    private final MaintainService maintainService;

    @Autowired
    public MaintainController(MaintainService maintainService) {
        this.maintainService = maintainService;
    }

    @GetMapping("/list")
    public String listView(String menuId, Model model) {
        return "car_mgmt/maintain/list";
    }

    @ResponseBody
    @RequestMapping("/getDataGrid")
    public Map<String, Object> getDataGrid(QueryParam param) {
        return maintainService.getDataGrid(param);
    }

    @GetMapping("/form")
    public String formView(String id, Model model) {
        if (id == null) {//新增
            model.addAttribute("category", 1);
            model.addAttribute("formData", new JSONObject());
        } else {//编辑
            model.addAttribute("category", 2);
            model.addAttribute("formData", JSON.toJSON(maintainService.getById(id)));
        }
        return "car_mgmt/maintain/form";
    }

    @ResponseBody
    @PostMapping("/subForm")
    public Map<String, Boolean> subForm(Maintain maintain) {
        Map<String, Boolean> result = new HashMap<>();
        try {
            if (maintain.getId() == null) {//新增
                maintainService.add(maintain);
            } else {//编辑
                maintainService.modify(maintain);
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
            maintainService.del(id);
            result.put("state", true);
        } catch (Exception e) {
            result.put("state", false);
        }
        return result;
    }
}
