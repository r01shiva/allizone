# frozen_string_literal:true

module SoftDelete
  extend ActiveSupport::Concern
  class_methods do
    def without_deleted
      where(deleted_at: nil)
    end

    def only_deleted
      where.not(deleted_at: nil)
    end

    def soft_delete_all
      update_all(deleted_at: Time.now)
    end

    def restore_all
      update_all(deleted_at: nil)
    end
  end

  def soft_delete
    update_attributes(deleted_at: Time.now)
  end

  def restore
    update_attributes(deleted_at: nil)
  end

  def really_delete!
    destroy
  end

  def deleted?
    deleted_at.present?
  end

  def active?
    !deleted?
  end
end
