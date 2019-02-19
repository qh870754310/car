package hd.car.service.carmgmt.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hd.car.dao.carmgmt.ArchivesDao;
import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Archives;
import hd.car.service.carmgmt.ArchivesService;
import hd.car.util.ParamHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 车辆档案-业务逻辑实现类
 * Created by jumpa on 2018/10/29 17:19.
 */
@Service
public class ArchivesServiceImpl implements ArchivesService {
    private final ArchivesDao archivesDao;

    @Autowired
    public ArchivesServiceImpl(ArchivesDao archivesDao) {
        this.archivesDao = archivesDao;
    }

    @Override
    public Map<String, Object> getDataGrid(QueryParam param) {
        Map<String, Object> map = ParamHelper.convertToMap(param.getParam());
        map.put("sortInfo", param.getSort() + " " + param.getOrder());
        PageHelper.startPage(param.getPage(), param.getRows());
        List<Archives> list = archivesDao.get(map);
        PageInfo<Archives> pageInfo = new PageInfo<>(list);
        map.clear();
        map.put("total", pageInfo.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Archives getById(String id) {
        return archivesDao.getById(id);
    }

    @Override
    public Map<String, Boolean> verifyLicense(String license) {
        Map<String, Boolean> result = new HashMap<>();
        int count = archivesDao.getCountByLicense(license);
        if (count > 0) {
            result.put("isRepeat", true);
        } else {
            result.put("isRepeat", false);
        }
        return result;
    }

    @Override
    public void add(Archives archives) throws Exception {
        archives.setId(UUID.randomUUID().toString());
        if (archivesDao.add(archives) != 1) {
            throw new Exception("添加失败");
        }
    }

    @Override
    public void modify(Archives archives) throws Exception {
        if (archivesDao.modify(archives) != 1) {
            throw new Exception("修改失败");
        }
    }

    @Override
    @Transactional
    public void del(String id) throws Exception {
        if (archivesDao.del(id) != 1) {
            throw new Exception("删除失败");
        }
    }

    @Override
    public List<Map> getAllArchives(Map map) {
        return archivesDao.getAllArchives(map);
    }

    @Override
    public List<Map> getHistoryTracksPoint(Map<String, Object> map) {
        return archivesDao.getHistoryTracksPoint(map);
    }
}
