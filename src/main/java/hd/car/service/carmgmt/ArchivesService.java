package hd.car.service.carmgmt;

import hd.car.model.QueryParam;
import hd.car.model.carmgmt.Archives;

import java.util.List;
import java.util.Map;

/**
 * 车辆档案-业务逻辑接口
 * Created by jumpa on 2018/10/29 17:18.
 */
public interface ArchivesService {
    /**
     * 获取列表
     *
     * @param param 查询参数
     * @return 列表
     */
    Map<String, Object> getDataGrid(QueryParam param);

    /**
     * 根据id获取
     *
     * @param id id
     * @return 对象
     */
    Archives getById(String id);

    /**
     * 验证车牌号是否重复
     *
     * @param license 车牌号
     * @return 验证结果
     */
    Map<String, Boolean> verifyLicense(String license);

    /**
     * 添加
     *
     * @param archives 对象
     * @throws Exception 异常信息
     */
    void add(Archives archives) throws Exception;

    /**
     * 修改
     *
     * @param archives 对象
     * @throws Exception 异常信息
     */
    void modify(Archives archives) throws Exception;

    /**
     * 删除
     *
     * @param id id
     * @throws Exception 异常信息
     */
    void del(String id) throws Exception;

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
