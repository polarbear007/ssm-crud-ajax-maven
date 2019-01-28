package cn.itcast.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
/**
 * 	这个类专门用来封装服务端返回给前台的所有数据
 *	以后如果前后端分离，那么前端将不会再有什么jsp 页面，我们也无法再通过 jsp 页面去直接解析 java 对象
 *	因此，我们需要把所有的数据全部都先转成 json 格式，然后在前端解析json ，再去填充数据
 * @author Administrator
 *
 */
public class JsonMessage implements Serializable{
	private static final long serialVersionUID = 8790477985732378574L;
	// 保存自定义的状态码，这个跟http 的状态码其实没有太大关系，只是为了方便获取信息而已
	// 这里暂时就两个简单的状态： 成功 200， 失败400
	private Integer code;
	// 这是跟状态码对应的具体状态描述，暂时也只有两种
	// 成功 / 失败
	private String message;
	// 这是保存所有要返回给前台的数据集合
	// 以前我们是直接把所有的数据放在 request 域里面，然后在 jsp 页面读取
	// 现在不行了，我们得把所有的数据都存在这个包装类的 content 里面，然后把这个包装类转成 json 格式
	// 发给前台，然后前台通过js 去解析和遍历 json 数据，再填充数据
	private Map<String, Object> content = new HashMap<>();
	
	public JsonMessage() {
		super();
	}
	
	// 添加两个静态的方法，方便创建对象
	public static JsonMessage success() {
		JsonMessage jmsg = new JsonMessage();
		jmsg.code = 200;
		jmsg.message = "数据请求成功";
		return jmsg;
	}
	// 添加两个静态的方法，方便创建对象
	public static JsonMessage fail() {
		JsonMessage jmsg = new JsonMessage();
		jmsg.code = 400;
		jmsg.message = "数据请求失败";
		return jmsg;
	}
	// 添加一个 add 方法，支持链式编程，方便我们添加数据
	public JsonMessage add(String key, Object value) {
		this.getContent().put(key, value);
		return this;
	}
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, Object> getContent() {
		return content;
	}
	public void setContent(Map<String, Object> content) {
		this.content = content;
	}
}
