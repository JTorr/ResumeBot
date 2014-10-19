class ResumePdf < Prawn::Document
  def initialize(resume)
    super()
    @y_position = cursor - 10
    @resume = resume
    header
    profile
    employment
    text_content
    # table_content
  end

  def header

    bounding_box([20, @y_position], :width => 270, :height => 300) do
      text "#{@resume.first_name}" + " " + "#{@resume.last_name}", size: 30, style: :bold
      text "Robot Coder Ninja", size: 20
    end

    bounding_box([260, @y_position], :width => 270, :height => 80) do
      text "e: #{@resume.email}", size: 10, align: :right
      text "w: RobotCoderNinja.com", size: 10, align: :right
      text "m: #{@resume.phone_1}", size: 10, align: :right
      text "#{@resume.address}", size: 10, align: :right
      text "#{@resume.city}" + ", " + "#{@resume.state}" + "#{@resume.postal_code}", size:10, align: :right
    end

  stroke_color "ff0000"
  stroke do
     horizontal_rule
  end

  def profile
    move_down 10
    bounding_box([20, @y_position - 100], :width => 270, :height => 20) do
      text "Personal Profile", size: 18, align: :left
    end

    bounding_box([150, @y_position - 105], :width => 270, :height => 20) do
      text "Instant Robot Coder Ninja! Just add coffee.", size:12, align: :right
    end

    stroke_color "ff0000"
      stroke do
         horizontal_rule
      end
    end
  end

  def employment
    move_down 10
    bounding_box([20, @y_position - 140], :width => 270, :height => 180) do
      text "Work", size:18, align: :left
      text "Experience", size:18, align: :left
    end

    count = 0
    exp = @resume.experiences.each do |exp|
      count += 1
      y = @y_position - 55 - (count * 90)
      bounding_box([240, y], :width => 270, :height => 180) do
        # binding.pry
        text "#{exp.company_name}", size: 18, align: :left
        text "#{exp.position}", size: 14, align: :left, style: :italic
        text "#{exp.summary}", size: 14, align: :left
      end
      move_up 100
    end

    # stroke_color "ff0000"
      stroke do
         horizontal_rule
      end
    end
  # end


  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 20

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text "#{@resume.first_name}" + " " + "#{@resume.last_name}"
      text "Lorem ipsum", size: 15, style: :bold
      text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
    end

    bounding_box([300, y_position], :width => 270, :height => 300) do
      text "Duis vel", size: 15, style: :bold
      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
    end

  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text "#{@resume.first_name}" + " " + "#{@resume.last_name}"
      text "Lorem ipsum", size: 15, style: :bold
      text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
    end

    bounding_box([300, y_position], :width => 270, :height => 300) do
      text "Duis vel", size: 15, style: :bold
      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
    end

  end

  # def table_content
  #   # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
  #   # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
  #   # Then I set the table column widths
  #   table resume_rows do
  #     row(0).font_style = :bold
  #     self.header = true
  #     self.row_colors = ['DDDDDD', 'FFFFFF']
  #     self.column_widths = [40, 300, 200]
  #   end
  # end
  #
  # def resume_rows
  #   [['#', 'Name', 'Price']] +
  #     @products.map do |product|
  #     [product.id, product.name, product.price]
  #   end
  # end
end
