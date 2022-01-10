package com.pet.Together.AddPet;

public class Pet {
	private int id;
	private String name;
	private String breed;
	private int sex;
	private String age;
	private String weight;
	private String info;
	private String location;
	private int state;
	private Img imgs;
	private String writer_id;

	public Pet() {
		super();
	}

	public Pet(int id, String name, String breed, int sex, String age, String weight, String info, String location,
			int state, String writer_id) {
		super();
		this.id = id;
		this.name = name;
		this.breed = breed;
		this.sex = sex;
		this.age = age;
		this.weight = weight;
		this.info = info;
		this.location = location;
		this.state = state;
		this.writer_id = writer_id;
	}

	public Pet(int id, String name, String breed, int sex, String age, String weight, String info, String location,
			int state, Img imgs, String writer_id) {
		super();
		this.id = id;
		this.name = name;
		this.breed = breed;
		this.sex = sex;
		this.age = age;
		this.weight = weight;
		this.info = info;
		this.location = location;
		this.state = state;
		this.imgs = imgs;
		this.writer_id = writer_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Img getImgs() {
		return imgs;
	}

	public void setImgs(Img imgs) {
		this.imgs = imgs;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	@Override
	public String toString() {
		return "Pet [id=" + id + ", name=" + name + ", breed=" + breed + ", sex=" + sex + ", age=" + age + ", weight="
				+ weight + ", info=" + info + ", location=" + location + ", state=" + state + ", imgs=" + imgs
				+ ", writer_id=" + writer_id + "]";
	}
}