class Subscription
  include ActiveModel::Model

  attr_accessor(
    :email,
    :name,
  )

  validates :email, presence: true
  validates :name, presence: true

  validates :email, :email => true


  def register
    if valid?
      subscribe_to!("jobs_demo@sandboxbbc35237adcf4754bf47784ef2c55cf5.mailgun.org")
    end
  end


  def subscribe_to!(mailing_list_address)
    user = self

    @member = MailingListMember.new
    @member.mailing_list_address = mailing_list_address
    @member.address = email
    @member.name = name
    @member.subscribed = "yes"
    @member.save

  end

end