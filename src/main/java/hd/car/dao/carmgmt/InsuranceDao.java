package hd.car.dao.carmgmt;

import hd.car.model.carmgmt.Insurance;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 保险记录-数据访问接口
 * Created by jumpa on 2018/10/30 15:15.
 */
@Repository
public interface InsuranceDao {
    int add(Insurance insurance);

    int modify(Insurance insurance);

    int del(String id);

    List<Insurance> get(Map param);

    Insurance getById(String id);
}
