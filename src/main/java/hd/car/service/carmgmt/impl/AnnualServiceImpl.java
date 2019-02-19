package hd.car.service.carmgmt.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hd.car.dao.carmgmt.AnnualDao;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Annual;
import hd.car.service.carmgmt.AnnualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 年检记录-业务逻辑接口
 * Created by jumpa on 2018/10/31 9:29.
 */
@Service
public class AnnualServiceImpl implements AnnualService {
    private final AnnualDao annualDao;

    @Autowired
    public AnnualServiceImpl(AnnualDao annualDao) {
        this.annualDao = annualDao;
    }

    @Override
    public Map<String, Object> getDataGrid(QueryParam param) {
        Map<String, Object> map = new HashMap<>();
        map.put("sortInfo", param.getSort() + " " + param.getOrder());
        PageHelper.startPage(param.getPage(), param.getRows());
        List<Annual> list = annualDao.get(map);
        PageInfo<Annual> pageInfo = new PageInfo<>(list);
        map.clear();
        map.put("total", pageInfo.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Annual getById(String id) {
        return annualDao.getById(id);
    }

    @Override
    public void add(Annual annual) throws Exception {
        annual.setId(UUID.randomUUID().toString());
        if (annualDao.add(annual) != 1) {
            throw new Exception("添加失败");
        }
    }

    @Override
    public void modify(Annual annual) throws Exception {
        if (annualDao.modify(annual) != 1) {
            throw new Exception("修改失败");
        }
    }

    @Override
    public void del(String id) throws Exception {
        if (annualDao.del(id) != 1) {
            throw new Exception("删除失败");
        }
    }
}
