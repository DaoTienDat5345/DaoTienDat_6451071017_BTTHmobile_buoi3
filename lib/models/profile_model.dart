class ProfileData {
  final int id;
  final String name;
  final String email;
  final String aboutMe;
  final String workExperience;
  final String education;
  final String skills;
  final String projects;
  final String certifications;
  final String languages;
  final String interests;
  final String referencesText;

  const ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.aboutMe,
    required this.workExperience,
    required this.education,
    required this.skills,
    required this.projects,
    required this.certifications,
    required this.languages,
    required this.interests,
    required this.referencesText,
  });

  factory ProfileData.empty() {
    return const ProfileData(
      id: 1,
      name: 'Nguyễn Văn A',
      email: '64570145@st.utc2.edu.vn',
      aboutMe: '',
      workExperience: '',
      education: '',
      skills: '',
      projects: '',
      certifications: '',
      languages: '',
      interests: '',
      referencesText: '',
    );
  }

  ProfileData copyWith({
    int? id,
    String? name,
    String? email,
    String? aboutMe,
    String? workExperience,
    String? education,
    String? skills,
    String? projects,
    String? certifications,
    String? languages,
    String? interests,
    String? referencesText,
  }) {
    return ProfileData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      aboutMe: aboutMe ?? this.aboutMe,
      workExperience: workExperience ?? this.workExperience,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      projects: projects ?? this.projects,
      certifications: certifications ?? this.certifications,
      languages: languages ?? this.languages,
      interests: interests ?? this.interests,
      referencesText: referencesText ?? this.referencesText,
    );
  }

  factory ProfileData.fromMap(Map<String, Object?> map) {
    return ProfileData(
      id: map['id'] as int? ?? 1,
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      aboutMe: map['about_me'] as String? ?? '',
      workExperience: map['work_experience'] as String? ?? '',
      education: map['education'] as String? ?? '',
      skills: map['skills'] as String? ?? '',
      projects: map['projects'] as String? ?? '',
      certifications: map['certifications'] as String? ?? '',
      languages: map['languages'] as String? ?? '',
      interests: map['interests'] as String? ?? '',
      referencesText: map['references_text'] as String? ?? '',
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'about_me': aboutMe,
      'work_experience': workExperience,
      'education': education,
      'skills': skills,
      'projects': projects,
      'certifications': certifications,
      'languages': languages,
      'interests': interests,
      'references_text': referencesText,
    };
  }
}

