package hd.car.dao.carmgmt;

import hd.car.model.carmgmt.Oiling;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 加油记录-数据访问接口
 * Created by jumpa on 2018/10/31 9:44.
 */
@Repository
public interface OilingDao {
    int add(Oiling oiling);

    int modify(Oiling oiling);

    int del(String id);

    List<Oiling> get(Map param);

    Oiling getById(String id);
}
