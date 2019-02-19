package hd.car.service.carmgmt.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hd.car.dao.carmgmt.OilingDao;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Oiling;
import hd.car.service.carmgmt.OilingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 加油记录-业务逻辑实现类
 * Created by jumpa on 2018/10/31 9:49.
 */
@Service
public class OilingServiceImpl implements OilingService {
    private final OilingDao oilingDao;

    @Autowired
    public OilingServiceImpl(OilingDao oilingDao) {
        this.oilingDao = oilingDao;
    }

    @Override
    public Map<String, Object> getDataGrid(QueryParam param) {
        Map<String, Object> map = new HashMap<>();
        map.put("sortInfo", param.getSort() + " " + param.getOrder());
        PageHelper.startPage(param.getPage(), param.getRows());
        List<Oiling> list = oilingDao.get(map);
        PageInfo<Oiling> pageInfo = new PageInfo<>(list);
        map.clear();
        map.put("total", pageInfo.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Oiling getById(String id) {
        return oilingDao.getById(id);
    }

    @Override
    public void add(Oiling oiling) throws Exception {
        oiling.setId(UUID.randomUUID().toString());
        if (oilingDao.add(oiling) != 1) {
            throw new Exception("添加失败");
        }
    }

    @Override
    public void modify(Oiling oiling) throws Exception {
        if (oilingDao.modify(oiling) != 1) {
            throw new Exception("修改失败");
        }
    }

    @Override
    public void del(String id) throws Exception {
        if (oilingDao.del(id) != 1) {
            throw new Exception("删除失败");
        }
    }
}
