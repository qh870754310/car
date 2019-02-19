package hd.car.dao.carmgmt;

import hd.car.model.carmgmt.Maintain;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 维修记录-数据访问接口
 * Created by jumpa on 2018/10/30 15:46.
 */
@Repository
public interface MaintainDao {
    int add(Maintain maintain);

    int modify(Maintain maintain);

    int del(String id);

    List<Maintain> get(Map param);

    Maintain getById(String id);
}
