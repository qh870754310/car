package hd.car.model.carmgmt;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 车辆档案
 * Created by jumpa on 2018/10/29 17:13.
 */
@Getter
@Setter
@Alias("archives")
public class Archives implements Serializable {
    private String id;
    private String licensePlate;
    private String category;
    private String principal;
    private String principalPhone;
    private String imei;
    private String model;
    private String phone;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date produceTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date endTime;
    private Integer state;
    private Integer acc;
    private Float electricity;
    private String locationType;
    private Date locationTime;
    private Double longitude;
    private Double latitude;
}
