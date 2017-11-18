require 'erb'
require 'yaml'
require 'sass'


class Resume
  attr_reader :root, :name, :contact_info, :sections, :template, :profile

  def initialize
    @root = File.expand_path('..', __dir__)
    @template = File.read(File.join(self.root, 'scripts', 'resume.erb'))
  end

  def read_source(source)
    puts "Reading in data from #{source}"
    resume_data = YAML.load_file(source)
    @name = resume_data['name']
    @contact_info = resume_data['contact']
    @profile = resume_data['profile']
    @sections = resume_data.reject { |key, value| ['name', 'contact', 'profile'].include?(key) }
  end

  def render
    ERB.new(self.template).result( binding )
  end

  def save_resume(file)
    puts "Saving your resume at #{file}"
    File.open(file, "w+") do |f|
      f.write(render)
    end
  end

  def compile_styles
    options = {
      cache: true,
      syntax: :scss,
      style: :compressed,
      filename: 'css/main.scss',
    }

    render = Sass::Engine.new(File.read('css/main.scss'), options).render
    File.write('css/main.css', render)
  end
end

myresume = Resume.new
resume_data = File.join(myresume.root, 'resume.yaml')
resume = File.join(myresume.root, 'resume.html')
myresume.read_source(resume_data)
myresume.save_resume(resume)
myresume.compile_styles
