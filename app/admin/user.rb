ActiveAdmin.register User, as: 'Runner' do

  # == Allowed attributes
  permit_params :first_name, :last_name, :email, :dni, :sex, :dob, :city, :gym,
                :phone, :emergency_phone, :medical_insurance, :shirt_size

  # == Filters
  filter :first_name
  filter :last_name
  filter :dni
  filter :email
  filter :created_at


  index do
    column :last_name
    column :first_name
    column :dni
    column :sex
    column("Dob"){ |u| u.dob.try(:strftime, "%d-%m-%Y") }
    column :city
    column :gym
    column :email
    column :phone
    column :emergency_phone
    column :medical_insurance
    column("Shirt Size"){ |u| u.shirt_size.try(:upcase) }
    column("Created At"){ |u| u.created_at.try(:strftime, "%d-%m-%Y %H:%M:%S %Z") }

    actions
  end


  form do |f|
    f.inputs I18n.t("active_admin.details", model: I18n.t('activerecord.models.user.one')) do
      f.input :first_name, input_html: { style: "width:300px" }
      f.input :last_name, input_html: { style: "width:300px" }
      f.input :dni, input_html: { style: "width:300px" }
      f.input :dob, as: :datepicker, input_html: { style: "width:200px" }
      f.input :sex, as: :select, collection: User::SEX.map{ |s| [s.titleize, s] }, include_blank: false, input_html: { style: "width:220px" }
      f.input :email, input_html: { style: "width:300px" }
      f.input :phone, input_html: { style: "width:300px" }
      f.input :city, input_html: { style: "width:300px" }
      f.input :gym, input_html: { style: "width:300px" }
      f.input :emergency_phone, input_html: { style: "width:300px" }
      f.input :medical_insurance, input_html: { style: "width:300px" }
      f.input :shirt_size, as: :select, collection: User::SHIRT_SIZE.map{ |s| [s.upcase, s] }, include_blank: false, input_html: { style: "width:220px" }
    end

    f.actions
  end
end
