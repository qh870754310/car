package hd.car.service.carmgmt.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hd.car.dao.carmgmt.InsuranceDao;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Insurance;
import hd.car.service.carmgmt.InsuranceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 保险记录-业务逻辑实现类
 * Created by jumpa on 2018/10/30 16:37.
 */
@Service
public class InsuranceServiceImpl implements InsuranceService {
    private final InsuranceDao insuranceDao;

    @Autowired
    public InsuranceServiceImpl(InsuranceDao insuranceDao) {
        this.insuranceDao = insuranceDao;
    }

    @Override
    public Map<String, Object> getDataGrid(QueryParam param) {
        Map<String, Object> map = new HashMap<>();
        map.put("sortInfo", param.getSort() + " " + param.getOrder());
        PageHelper.startPage(param.getPage(), param.getRows());
        List<Insurance> list = insuranceDao.get(map);
        PageInfo<Insurance> pageInfo = new PageInfo<>(list);
        map.clear();
        map.put("total", pageInfo.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Insurance getById(String id) {
        return insuranceDao.getById(id);
    }

    @Override
    public void add(Insurance insurance) throws Exception {
        insurance.setId(UUID.randomUUID().toString());
        if (insuranceDao.add(insurance) != 1) {
            throw new Exception("添加失败");
        }
    }

    @Override
    public void modify(Insurance insurance) throws Exception {
        if (insuranceDao.modify(insurance) != 1) {
            throw new Exception("修改失败");
        }
    }

    @Override
    public void del(String id) throws Exception {
        if (insuranceDao.del(id) != 1) {
            throw new Exception("删除失败");
        }
    }
}
