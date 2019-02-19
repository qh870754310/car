package hd.car.dao.carmgmt;

import hd.car.model.carmgmt.Annual;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 年检记录-数据访问接口
 * Created by jumpa on 2018/10/31 9:23.
 */
@Repository
public interface AnnualDao {
    int add(Annual annual);

    int modify(Annual annual);

    int del(String id);

    List<Annual> get(Map param);

    Annual getById(String id);
}
