class Task
	attr_reader :content, :id
  attr_accessor :created_at
	@@current_id = 1
	def initialize(content)
		@content = content
		@id = @@current_id
		@@current_id +=1
		@complete = false
		@created_at = Time.new.inspect
		@updated_at = nil
	end

	def complete?
		@complete
	end

	def complete!
		@complete = true
	end

  def update_content! new_content
    @content = new_content
  end

  def make_incomplete! 
    @complete = false
  end

end