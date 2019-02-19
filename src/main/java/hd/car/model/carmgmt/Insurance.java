package hd.car.model.carmgmt;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 保险记录
 * Created by jumpa on 2018/10/30 15:39.
 */
@Getter
@Setter
@Alias("insurance")
public class Insurance implements Serializable {
    private String id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date insTime;
    private Float insAmount1;
    private String insNo;
    private Float insAmount2;
    private String insCo;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date endTime;
    private String handlePerson;
}
