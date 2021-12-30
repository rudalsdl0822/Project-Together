package com.pet.Together.AddPet;

public class Pet {
	private int id;
	private String name;
	private String breed;
	private int sex;
	private int age;
	private long weight;
	private String info;
	private String location;
	private int state;
	private Img imgs;

	public Pet() {
		super();
	}

	public Pet(int id, String name, String breed, int sex, int age, long weight, String info, String location,
			int state, Img imgs) {
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public long getWeight() {
		return weight;
	}

	public void setWeight(long weight) {
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

	@Override
	public String toString() {
		return "Pet [id=" + id + ", name=" + name + ", breed=" + breed + ", sex=" + sex + ", age=" + age + ", weight="
				+ weight + ", info=" + info + ", location=" + location + ", state=" + state + ", imgs=" + imgs + "]";
	}


	
}