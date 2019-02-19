package hd.car.dao.carmgmt;

import hd.car.model.carmgmt.Archives;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 车辆档案-数据访问接口
 * Created by jumpa on 2018/10/29 17:18.
 */
@Repository
public interface ArchivesDao {
    /**
     * 新增
     *
     * @param archives 档案对象
     * @return 影响行数
     */
    int add(Archives archives);

    /**
     * 修改
     *
     * @param archives 档案对象
     * @return 影响行数
     */
    int modify(Archives archives);

    /**
     * 删除
     *
     * @param id 主键id
     * @return 影响行数
     */
    int del(String id);

    /**
     * 查询
     *
     * @param param 参数
     * @return 档案对象列表
     */
    List<Archives> get(Map param);

    /**
     * 根据id查询
     *
     * @param id 主键id
     * @return 档案对象
     */
    Archives getById(String id);

    /**
     * 根据车牌号获取记录数
     *
     * @param license 车牌号
     * @return 记录数
     */
    int getCountByLicense(String license);

    /**
     * 根据条件查询车辆信息
     * @param map
     * @return
     */
    List<Map> getAllArchives(Map map);

    /**
     * 根据条件获取历史轨迹
     * @param map
     * @return
     */
    List<Map> getHistoryTracksPoint(Map<String, Object> map);
}
