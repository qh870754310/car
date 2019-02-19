package hd.car.service.carmgmt;

import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Maintain;

import java.util.Map;

/**
 * 维修记录-业务逻辑接口
 * Created by jumpa on 2018/10/30 15:57.
 */
public interface MaintainService {
    Map<String, Object> getDataGrid(QueryParam param);

    Maintain getById(String id);

    void add(Maintain maintain) throws Exception;


    void modify(Maintain maintain) throws Exception;


    void del(String id) throws Exception;
}
