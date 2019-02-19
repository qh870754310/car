package hd.car.model.carmgmt;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 年检记录
 * Created by jumpa on 2018/10/30 15:42.
 */
@Getter
@Setter
@Alias("annual")
public class Annual implements Serializable {
    private String id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date annualTime;
    private Float annualCosts;
    private String handlePerson;
    private String adminOffice;
}
