# frozen_string_literal: true

puts 'Creating Application'
a = Application.create

puts 'Creating Api Keys'
ApiKey.create(application: a,
              creator: true, submitter: true, analytics: true,
              token: '810cb082-1beb-4cb4-9f78-baeb330a42c5')
ApiKey.create(application: a, creator: false, submitter: true, analytics: true)
ApiKey.create(application: a, creator: false, submitter: false, analytics: true)

f = Form.create(application: a)

puts 'Creating Sections'
s1 = Section.create(name: 'Personal Information',
                    form: f,
                    order: 1,
                    content: 'This section is for personal information')

s2 = Section.create(name: 'Other Information',
                    form: f,
                    order: 2,
                    content: 'Section for leadership and interests')

s3 = Section.create(name: 'SERVE Day Store',
                    form: f,
                    order: 3,
                    content: 'This section is for the SERVE Day store')

## Questions
puts 'Creating Questions'

Question.create(section: s1,
                order: 1,
                key: 'first-name', label: 'First Name',
                placeholder: 'First Name',
                required: true,
                question_type: 'string', hidden: false)

Question.create(section: s1,
                order: 2,
                key: 'last-name', label: 'Last Name',
                placeholder: 'Last Name',
                required: true,
                question_type: 'string', hidden: false)

# Age
age_question = Question.create(section: s1,
                order: 3,
                key: 'age', label: 'Age',
                placeholder: 'Age',
                required: true,
                question_type: 'select', hidden: false)

Choice.create(question: age_question, label: '0-10')
Choice.create(question: age_question, label: '11-20')
Choice.create(question: age_question, label: '20-30')
Choice.create(question: age_question, label: '30-50')
Choice.create(question: age_question, label: '50+')

Question.create(section: s1,
                order: 4,
                key: 'email', label: 'Email',
                placeholder: 'Email',
                required: true,
                question_type: 'string', hidden: false)

Question.create(section: s1,
                order: 5,
                key: 'phone', label: 'Phone',
                placeholder: 'Phone',
                required: true,
                question_type: 'string', hidden: false)

Question.create(section: s1,
                order: 6,
                key: 'address', label: 'Address',
                placeholder: 'Address',
                required: true,
                question_type: 'address', hidden: false)

# Second Section

campus_question = Question.create(section: s2,
                order: 7, key: 'campus', label: 'Which campus do you attend?',
                question_type: 'radio', hidden: false)

Choice.create(question: campus_question, label: 'Grants Mill')
Choice.create(question: campus_question, label: 'Alabaster')
Choice.create(question: campus_question, label: 'Auburn')
Choice.create(question: campus_question, label: 'Español')
Choice.create(question: campus_question, label: 'Fultondale')
Choice.create(question: campus_question, label: 'Greystone')
Choice.create(question: campus_question, label: 'Huntsville')
Choice.create(question: campus_question, label: 'Montgomery')

Question.create(section: s1,
                order: 8,
                key: 'leadership', label: 'Leadership',
                content: 'I am interested in leading/co-leading an Outreach Small Group
                and would like to discuss with a member of the Outrech team',
                question_type: 'boolean', hidden: false)

# I am interested in
interest_question = Question.create(section: s1,
                                    order: 9,
                                    key: 'leadership', label: 'Leadership',
                                    question_type: 'checkboxes', hidden: false)

Choice.create(question: interest_question, label: 'Elderly')
Choice.create(question: interest_question, label: 'Kids')
Choice.create(question: interest_question, label: 'Foster Families')
Choice.create(question: interest_question, label: 'Other(Describe Below)')

Question.create(section: s1,
                order: 10,
                key: 'other-interest', label: 'If you chose Other above, please describe',
                question_type: 'string', hidden: false)

learn_more_question = Question.create(section: s1,
                                    order: 11,
                                    key: 'leadership', label: 'I would like to learn more about',
                                    question_type: 'checkboxes', hidden: false)

Choice.create(question: learn_more_question, label: 'First Saturday Outreach')
Choice.create(question: learn_more_question, label: 'Outreach S mall Groups')
Choice.create(question: learn_more_question, label: 'Christ Health Center(Birmingham)')
Choice.create(question: learn_more_question, label: 'Highlands Prison Ministry')

Question.create(section: s3,
                order: 10,
                key: 'serve-day-story', content: 'I have a SERVE Day story I would like to share!',
                question_type: 'boolean', hidden: false)

# Admin User
puts 'Creating an AdminUser'
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
