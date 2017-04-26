# frozen_string_literal: true

puts 'Creating Application'
a = Application.create

puts 'Creating Api Keys'
ApiKey.create(application: a, creator: true, submitter: true, analytics: true)
ApiKey.create(application: a, creator: false, submitter: true, analytics: true)
ApiKey.create(application: a, creator: false, submitter: false, analytics: true)

f = Form.create(application: a)

s1 = Section.create(name: 'My section',
                    form: f,
                    order: 0,
                    content: 'This section is for test')

s2 = Section.create(name: 'My second section',
                    form: f,
                    order: 1,
                    content: 'This section is for a second test')

Question.create(section: s1,
                order: 0,
                key: 'Key', label: 'This is a label',
                content: 'What is this question?',
                question_type: 'string', hidden: false)

Question.create(section: s2,
                order: 1,
                key: 'Key', label: 'This is a label',
                content: 'What is this question?',
                question_type: 'string', hidden: false)
