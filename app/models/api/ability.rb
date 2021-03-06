class Api::Ability
  include CanCan::Ability

  def initialize token
    @token = token
    @person = token.account
    @client = token.client

    for_person(@person) if @person
    for_client(@client) if @client
  end

  def for_person(person)
    can :read, Roster::Person
    can :read, Roster::Chapter, id: person.chapter_id
  end

  def for_client(client)
    can :read, Roster::Chapter
  end

end