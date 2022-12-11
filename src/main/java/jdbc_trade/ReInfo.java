package jdbc_trade;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ReInfo {
    /**
     * ����Map
     * @return Map
     * @ǰ��dataType : "json",
     */
    @ResponseBody
    @RequestMapping(value = "/testReturnData2", method = RequestMethod.POST)
    public Map<String, String> testMap() {
        //�������
        HashMap<String, String> map = new HashMap<>();
        map.put("name","Tom");
        map.put("job","cat");
        map.put("age","14");

        return map;
    }
}
