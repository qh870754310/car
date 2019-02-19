package hd.car.service.carmgmt;

import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Maintain;
import hd.car.model.carmgmt.Oiling;

import java.util.Map;

/**
 * 加油记录-业务逻辑接口
 * Created by jumpa on 2018/10/30 15:57.
 */
public interface OilingService {
    Map<String, Object> getDataGrid(QueryParam param);

    Oiling getById(String id);

    void add(Oiling oiling) throws Exception;


    void modify(Oiling oiling) throws Exception;


    void del(String id) throws Exception;
}
