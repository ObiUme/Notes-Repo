class NoteSerializer < ActiveModel::Serializer
  attributes :id, :memo
  has_one :user
end
