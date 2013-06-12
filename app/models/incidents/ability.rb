class Incidents::Ability
  include CanCan::Ability

  def initialize(person)
    can :read, :incidents
    can [:read, :needs_report], Incidents::Incident
    can :read_details, Incidents::Incident
    can :create, Incidents::DatIncident

    return unless %w(Laxson Hersher Hancock Terrell).include? person.last_name
    
    can :read_case_details, Incidents::Incident
    can :read_dat_details, Incidents::Incident

    can :tracker, Incidents::Incident

    can [:create, :update], Incidents::DatIncident

    # Admin Privs
    can [:link_cas], Incidents::Incident
    can [:read, :promote], Incidents::CasIncident
    can [:manage], Incidents::CasCase
  end
end
