class ResumePdf < Prawn::Document
  def initialize(resume)
    super()
    @y_position = cursor - 10
    @y1 = cursor - 50
    @c = @y1 -400
    @resume = resume
    header
    profile
    sections
  end

  def body_text(string)
    text "#{string}", size: 10, align: :right
  end

  def other_text(string, size = 10, align = :left, style = :normal)
    text "#{string}", size: size, align: align, style: style
  end

  def sections
    #TODO: refactor to check each method, then run non-empty methods
    unless @resume.experiences.empty?
      employment
    end

    unless @resume.skills.count == 0
      skills
    end

    unless @resume.educations.empty?
      education
    end
  end

  def underline
    stroke_color "ff0000"
    stroke do
      horizontal_rule
    end
  end

  def header

    bounding_box([20, @y_position], :width => 270, :height => 300) do
      other_text("#{@resume.first_name}" + " " + "#{@resume.last_name}", 30, :left, :bold)
      other_text("Robot Coder Ninja", 20)
    end

    bounding_box([260, @y_position], :width => 270, :height => 80) do
      body_text("e: #{@resume.email}")
      body_text("w: RobotCoderNinja.com")
      body_text("m: #{@resume.phone_1}")
      body_text("#{@resume.address}")
      body_text("#{@resume.city}" + ", " + "#{@resume.state}" + "#{@resume.postal_code}")
    end
    underline
  end

  def profile
    move_down 10
    bounding_box([20, @y_position - 100], :width => 270, :height => 20) do
      other_text("Personal Profile", 18, :left)
    end

    bounding_box([150, @y_position - 105], :width => 270, :height => 20) do
      other_text("Instant Robot Coder Ninja! Just add coffee.", 12, :right)
    end
    underline
  end

  def employment
    move_down 10
    bounding_box([20, @y_position - 140], :width => 270, :height => 180) do
      other_text("Work", 18, :left)
      other_text("Experience", 18, :left)
    end

    count = 0
    exp = @resume.experiences.each do |exp|
      count += 1
      @y1 = @y_position - 55 - (count * 90)

      bounding_box([180, @y1], :width => 270, :height => 180) do
        other_text("#{exp.company_name}", 18, :left)
        other_text("#{exp.position}", 14, :left, :italic)
        other_text("#{exp.summary}", 14, :left)
      end
    end
    move_up 100
    underline
  end

  def skills
    move_down 10
    bounding_box([20, @y1 - 100], :width => 270, :height => 180) do
      other_text("Key Skills", 18, :left)
    end

    count = 0
    exp = @resume.skills.each do |skill|
      count += 1
      @y2 = @y1 - 55 - (count * 20)
      #TODO: break out into bullet method
      float do
        bounding_box [170, @y2 - 30], :width => 10 do
          text "•"
        end
      end
      bounding_box([180, @y2 - 30], :width => 270, :height => 140) do
        text "#{skill.name}", size: 14, align: :left
      end
    end
      move_up 100
      @c = cursor
      underline
  end

  def education
    move_down 10
    bounding_box([20, @c - 10], :width => 270, :height => 180) do
      text "Education", size:18, align: :left
    end

    count = 0
    ed = @resume.educations.each do |ed|
      count += 1
      @y3 = @c + 70 - (count * 90)
      bounding_box([180, @y3], :width => 270, :height => 180) do
        text "#{ed.institution}", size: 18, align: :left
        text "#{ed.area}", size: 14, align: :left, style: :italic
        text "#{ed.study_type}", size: 14, align: :left
      end
      move_up 100
    end
  end
end
