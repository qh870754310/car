package hd.car.model.carmgmt;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 加油记录
 * Created by jumpa on 2018/10/30 15:36.
 */
@Getter
@Setter
@Alias("maintain")
public class Maintain implements Serializable {
    private String id;
    private String maintainReason;
    private Float maintainCosts;
    private String handlePerson;
    private String maintainOrgan;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date sendTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date getTime;
}
