package hd.car.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 参数帮助类
 * Created by zhengda.li on 2017/3/17 14:34.
 */
public class ParamHelper {
    /**
     * 把字符串参数分割转换成map类型
     *
     * @param param 字符串参数
     * @return map型参数
     */
    public static Map<String, Object> convertToMap(String param) {
        Map<String, Object> map = new HashMap<>();
        if (param != null && !"".equals(param.trim())) {
            String[] params = param.split("≌");
            for (String p : params) {
                map.put(p.split("☻")[0], p.split("☻")[1]);
            }
        }
        return map;
    }
}
