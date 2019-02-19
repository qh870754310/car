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
 * Created by jumpa on 2018/10/30 15:43.
 */
@Getter
@Setter
@Alias("oiling")
public class Oiling implements Serializable {
    private String id;
    private Float oilQuantity;
    private Float unitPrice;
    private Float totalPrice;
    private String oilStation;
    private String handlePerson;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date oilTime;
}
