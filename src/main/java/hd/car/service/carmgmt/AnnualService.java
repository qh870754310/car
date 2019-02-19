package hd.car.service.carmgmt;

import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Annual;

import java.util.Map;

/**
 * 年检记录-业务逻辑接口
 * Created by jumpa on 2018/10/30 15:57.
 */
public interface AnnualService {
    Map<String, Object> getDataGrid(QueryParam param);

    Annual getById(String id);

    void add(Annual annual) throws Exception;


    void modify(Annual annual) throws Exception;


    void del(String id) throws Exception;
}
