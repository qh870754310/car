package hd.car.service.carmgmt.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hd.car.dao.carmgmt.MaintainDao;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Maintain;
import hd.car.service.carmgmt.MaintainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 维修记录-业务逻辑实现类
 * Created by jumpa on 2018/10/30 15:57.
 */
@Service
public class MaintainServiceImpl implements MaintainService {
    private final MaintainDao maintainDao;

    @Autowired
    public MaintainServiceImpl(MaintainDao maintainDao) {
        this.maintainDao = maintainDao;
    }

    @Override
    public Map<String, Object> getDataGrid(QueryParam param) {
        Map<String, Object> map = new HashMap<>();
        map.put("sortInfo", param.getSort() + " " + param.getOrder());
        PageHelper.startPage(param.getPage(), param.getRows());
        List<Maintain> list = maintainDao.get(map);
        PageInfo<Maintain> pageInfo = new PageInfo<>(list);
        map.clear();
        map.put("total", pageInfo.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Maintain getById(String id) {
        return maintainDao.getById(id);
    }

    @Override
    public void add(Maintain maintain) throws Exception {
        maintain.setId(UUID.randomUUID().toString());
        if (maintainDao.add(maintain) != 1) {
            throw new Exception("添加失败");
        }
    }

    @Override
    public void modify(Maintain maintain) throws Exception {
        if (maintainDao.modify(maintain) != 1) {
            throw new Exception("修改失败");
        }
    }

    @Override
    public void del(String id) throws Exception {
        if (maintainDao.del(id) != 1) {
            throw new Exception("删除失败");
        }
    }
}
