
  class ContactMailer
    def contact_email(contact_form)
      set_contact(contact_form)

      mail to: 'dumas.francois@laposte.net', subject: "New contact"
    end

    private

    def set_contact(contact_form)
      @contact_form = contact_form
    end
  end
