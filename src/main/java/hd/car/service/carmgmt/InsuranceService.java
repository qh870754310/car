package hd.car.service.carmgmt;

import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Insurance;
import hd.car.model.carmgmt.Maintain;

import java.util.Map;

/**
 * 保险记录-业务逻辑接口
 * Created by jumpa on 2018/10/30 16:37.
 */
public interface InsuranceService {
    Map<String, Object> getDataGrid(QueryParam param);

    Insurance getById(String id);

    void add(Insurance insurance) throws Exception;


    void modify(Insurance insurance) throws Exception;


    void del(String id) throws Exception;
}
