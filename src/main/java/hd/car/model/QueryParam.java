package hd.car.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * 查询参数
 * Created by zhengda.li on 2018/1/18 13:28.
 */
@Getter
@Setter
@ToString
public class QueryParam implements Serializable {
    private Integer rows;//每页数量
    private Integer page;//页码
    private String sort;//排序字段
    private String order;//排序类型
    private String param;//查询参数
    private String sql;//sql条件
}
