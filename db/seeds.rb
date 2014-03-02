
Admin.destroy_all
JobType.destroy_all
Category.destroy_all
JobPost.destroy_all

Admin.create!(
  email: "admin@ladieslearningcode.com",
  password:"1234"
)

User.create!( email: "test_user@nomail.com", password: "1234" ) if User.count.zero?

categories = []
category_names = ["Account Management", "Business Development", "Client Services", "Communications", "Customer Service", "Design"]
category_names.each { |name| categories << Category.create(name: name) }

job_types = []
job_type_names = ["Permanent", "Freelance", "Contract"]
job_type_names.each { |job_type| job_types << JobType.create(name: job_type) }

job_posts = [{
  title: "Web Developer",
  description: "Whether on-air or behind the scenes, here you join a team that thrives on making the connections and telling the stories that are important to Canadians. So, if you’ve got the ability to keep up with the pace of our ever-changing industry, the passion to make the next great idea even better and the drive to make things happen, this is the place for you."
},{
  title: "Android Developer",
  description: "Our goal is to wow our clients in everything we do. Being part of our team means experiencing the buzz of a growing firm that’s focused on fresh ideas and lean entrepreneurial thinking. We want to look back on our work and careers and be proud not only of the successes, but of how we’ve made a difference to organizations, their staff and their customers. We always aim to do the right thing and along the way be able to say, ‘Wow, that was pretty cool’."
},{
  title: "Front-End / WordPress Developer",
  description: "Blue Ant Media is a privately held integrated Canadian media company that creates and distributes great content in lifestyle, travel, documentary, music and entertainment categories. The company owns specialty channels Cottage Life, Travel+Escape, Bite TV, and AUX TV along with four premium, commercial-free channels Oasis HD, HIFI, Smithsonian Channel Canada, radX and their companion websites. Blue Ant Media’s digital publishing division produces daily content for its web and mobile sites, AUX Magazine, a monthly music tablet magazine and recently launched Travel+Escape Magazine, a monthly travel tablet magazine."
},{
  title: "Customer and Team Support Manager",
  description: "At ShopLocket, we pride ourselves on providing the best support we can to our sellers and community. Your ability to problem solve and understand our sellers’ needs will make our community feel all warm and fuzzy inside. While not rocking out support, you’ll be helping with miscellaneous tasks and administrative activities around the office."
},{
  title: "Events / Community Manager",
  description: "ShopLocket aims to be a significant resource and product marketplace for hardware entrepreneurs. We want to strengthen the community through events, information resources and other forms of support. Your energy and creativity will help us grow and strengthen our connections in the hardware community."
},{
  title: "IOS Developer",
  description: "If you’re passionate, disciplined, fearless, creative, and want to build some badass software, send us your résumé and tell us what you’ve done, especially in the areas of agile development, cloud computing, Web 2.0 and high-performance user interfaces."
}]

job_posts.each do |job_post|
  posting = JobPost.new( job_post )

  posting.due_date = 3.months.from_now
  posting.city = "Ottawa"
  posting.country = "Canada"
  posting.job_type = job_types.sample
  posting.category = categories.sample
  posting.user = User.first

  posting.save

  posting.activate
end
