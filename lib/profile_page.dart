import 'package:btthmobilebuoi3/data/profile_database.dart';
import 'package:btthmobilebuoi3/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileData _profile = ProfileData.empty();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await ProfileDatabase.instance.getProfile();
    if (!mounted) return;
    setState(() {
      _profile = profile;
      _loading = false;
    });
  }

  Future<void> _saveProfile(ProfileData profile) async {
    await ProfileDatabase.instance.saveProfile(profile);
    if (!mounted) return;
    setState(() {
      _profile = profile;
    });
  }

  Future<void> _editField({
    required String title,
    required String initialValue,
    required Future<void> Function(String value) onSaved,
  }) async {
    final controller = TextEditingController(text: initialValue);

    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            maxLines: 5,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(
                dialogContext,
                controller.text.trim(),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (result == null) return;
    await onSaved(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 10),
                  Text(_profile.name),
                  const SizedBox(height: 10),
                  Text(_profile.email),
                  const SizedBox(height: 10),
                  InfoItemWidget(
                    title: 'About me',
                    iconUrl: 'assets/icons/Icon.svg',
                    subtitle: _profile.aboutMe.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.aboutMe,
                    onTap: () async {
                      await _editField(
                        title: 'About me',
                        initialValue: _profile.aboutMe,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(aboutMe: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Work Experience',
                    iconUrl: 'assets/icons/Icon (1).svg',
                    subtitle: _profile.workExperience.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.workExperience,
                    onTap: () async {
                      await _editField(
                        title: 'Work Experience',
                        initialValue: _profile.workExperience,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(workExperience: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Education',
                    iconUrl: 'assets/icons/Icon.svg',
                    subtitle: _profile.education.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.education,
                    onTap: () async {
                      await _editField(
                        title: 'Education',
                        initialValue: _profile.education,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(education: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Skills',
                    iconUrl: 'assets/icons/Icon (1).svg',
                    subtitle: _profile.skills.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.skills,
                    onTap: () async {
                      await _editField(
                        title: 'Skills',
                        initialValue: _profile.skills,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(skills: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Projects',
                    iconUrl: 'assets/icons/Icon.svg',
                    subtitle: _profile.projects.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.projects,
                    onTap: () async {
                      await _editField(
                        title: 'Projects',
                        initialValue: _profile.projects,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(projects: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Certifications',
                    iconUrl: 'assets/icons/Icon (1).svg',
                    subtitle: _profile.certifications.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.certifications,
                    onTap: () async {
                      await _editField(
                        title: 'Certifications',
                        initialValue: _profile.certifications,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(certifications: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Languages',
                    iconUrl: 'assets/icons/Icon.svg',
                    subtitle: _profile.languages.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.languages,
                    onTap: () async {
                      await _editField(
                        title: 'Languages',
                        initialValue: _profile.languages,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(languages: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'Interests',
                    iconUrl: 'assets/icons/Icon (1).svg',
                    subtitle: _profile.interests.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.interests,
                    onTap: () async {
                      await _editField(
                        title: 'Interests',
                        initialValue: _profile.interests,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(interests: value),
                        ),
                      );
                    },
                  ),
                  InfoItemWidget(
                    title: 'References',
                    iconUrl: 'assets/icons/Icon.svg',
                    subtitle: _profile.referencesText.isEmpty
                        ? 'Chưa có thông tin'
                        : _profile.referencesText,
                    onTap: () async {
                      await _editField(
                        title: 'References',
                        initialValue: _profile.referencesText,
                        onSaved: (value) => _saveProfile(
                          _profile.copyWith(referencesText: value),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

class InfoItemWidget extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String? subtitle;
  final VoidCallback onTap;
  const InfoItemWidget({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(iconUrl),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: SvgPicture.asset('assets/icons/Add.svg'),
    );
  }
}
