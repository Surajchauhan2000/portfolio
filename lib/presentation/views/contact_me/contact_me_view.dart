import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/string_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:pretty_animated_buttons/widgets/pretty_capsule_button.dart';

import '../../../domain/contact_viewmodel.dart';
import '../../../injection.dart';
import '../../utils/configs/constant_assets.dart';
import '../../utils/configs/constant_color.dart';
import '../../utils/configs/constant_icons.dart';
import '../../utils/configs/constant_sizes.dart';
import '../../utils/configs/constants_strings.dart';
import '../../widgets/animated_text_field.dart';
import '../wrapper.dart';

class ContactMeView extends StatelessWidget {
  const ContactMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      page: GetInTouchPage(),
    );
  }
}

class GetInTouchPage extends StatefulWidget {
  const GetInTouchPage({super.key});

  @override
  State<GetInTouchPage> createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage>
    with TickerProviderStateMixin {
  // final _contactVM = locator.get<ContactViewModel>();
  final _contactVM = locator.get<ContactViewModel>();
  bool hasError = false;
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  late AnimationController _nameAnimationController;
  late AnimationController _jobAnimationController;
  late AnimationController _emailAnimationController;
  late AnimationController _phoneAnimationController;
  late AnimationController _messageAnimationController;
  late AnimationController _snackbarAnimationController;

  final _nameNode = FocusNode();
  final _jobNode = FocusNode();
  final _emailNode = FocusNode();
  final _phoneNode = FocusNode();
  final _messageNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _nameAnimationController =
        AnimationController(vsync: this, duration: duration500);
    _jobAnimationController =
        AnimationController(vsync: this, duration: duration500);
    _emailAnimationController =
        AnimationController(vsync: this, duration: duration500);
    _phoneAnimationController =
        AnimationController(vsync: this, duration: duration500);
    _messageAnimationController =
        AnimationController(vsync: this, duration: duration500);
    _snackbarAnimationController =
        AnimationController(vsync: this, duration: duration500)
          ..addStatusListener(snackBarListener);
    _nameNode.addListener(nameListener);
    _jobNode.addListener(jobListener);
    _emailNode.addListener(emailListener);
    _phoneNode.addListener(phoneListener);
    _messageNode.addListener(messageListener);
  }

  void snackBarListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(
          duration1000, () => _snackbarAnimationController.reverse());
    }
  }

  void nameListener() {
    if (_nameNode.hasFocus) {
      _nameAnimationController.forward();
    } else {
      if (_nameAnimationController.isCompleted) {
        _nameAnimationController.reverse();
      }
    }
  }

  void jobListener() {
    if (_jobNode.hasFocus) {
      _jobAnimationController.forward();
    } else {
      if (_jobAnimationController.isCompleted) {
        _jobAnimationController.reverse();
      }
    }
  }

  void emailListener() {
    if (_emailNode.hasFocus) {
      _emailAnimationController.forward();
    } else {
      if (_emailAnimationController.isCompleted) {
        _emailAnimationController.reverse();
      }
    }
  }

  void phoneListener() {
    if (_phoneNode.hasFocus) {
      _phoneAnimationController.forward();
    } else {
      if (_phoneAnimationController.isCompleted) {
        _phoneAnimationController.reverse();
      }
    }
  }

  void messageListener() {
    if (_messageNode.hasFocus) {
      _messageAnimationController.forward();
    } else {
      if (_messageAnimationController.isCompleted) {
        _messageAnimationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _nameAnimationController.dispose();
    _jobAnimationController.dispose();
    _emailAnimationController.dispose();
    _messageAnimationController.dispose();
    _snackbarAnimationController.dispose();
    _nameController.dispose();
    _jobController.dispose();
    _emailController.dispose();
    _messageController.dispose();

    _nameNode.dispose();
    _jobNode.dispose();
    _emailNode.dispose();
    _messageNode.dispose();
    super.dispose();
  }

  void clearData() {
    _nameController.clear();
    _jobController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  void sendMessage() {
    _contactVM.name = _nameController.text;
    _contactVM.job = _jobController.text;
    _contactVM.email = _emailController.text;
    _contactVM.message = _messageController.text;
    _contactVM.phone = _phoneController.text;
    bool hasSent = _contactVM.sendMessage();
    if (hasSent) clearData();
    _snackbarAnimationController.forward();
    setState(() {
      hasError = !hasSent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      ClipRRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: s10, sigmaY: s10),
          child: SvgPicture.asset(
            kaMess,
            semanticsLabel: 'Mess SVG',
            width: context.percentHeight(s70),
            height: context.percentHeight(s70),
          ).addOpacity(opacity: 0.1),
        ),
      ).addAlign(alignment: Alignment.topRight),
      ClipRRect(
        child: Transform.scale(
          scaleX: -1,
          child: SvgPicture.asset(
            kaMessage,
            semanticsLabel: 'Message SVG',
            width: context.percentHeight(s20),
            height: context.percentHeight(s20),
          ),
        ).addOpacity(opacity: 0.05),
      ).addAlign(alignment: Alignment.bottomLeft),
      <Widget>[
        Text(
          'Get In Touch'.prefixSlash(),
          style: context.adaptive(Theme.of(context).textTheme.bodySmall,
              Theme.of(context).textTheme.bodyMedium),
        ),
        verticalSpaceMedium,
        Text(
          'Contact',
          style: context.adaptive(Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.titleLarge),
        ),
        context.percentSizedBox(pHeight: s12),
        <Widget>[
          AnimatedTextField(
            animation: _nameAnimationController,
            node: _nameNode,
            textController: _nameController,
            hintText: 'Enter Your Name',
            // width: context.percentWidth(context.adaptive(s40, s20)),
            width: (context.isMobile)
                ? context.percentWidth(35)
                : context.percentWidth(35),
          ),
          context.percentSizedBox(pHeight: s8),
          AnimatedTextField(
            animation: _emailAnimationController,
            node: _emailNode,
            hintText: 'Enter your Email Here',
            textController: _emailController,
            isEmail: true,
            width: (context.isMobile)
                ? context.percentWidth(45)
                : context.percentWidth(35),
          ),
          context.percentSizedBox(pHeight: s8),
          AnimatedTextField(
            animation: _phoneAnimationController,
            node: _phoneNode,
            hintText: 'Enter Phone number here',
            textController: _phoneController,
            width: (context.isMobile)
                ? context.percentWidth(55)
                : context.percentWidth(35),
          ),
        ].addColumn(
          // Replace addWrap() with addColumn()
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        context.percentSizedBox(pHeight: context.adaptive(s8, s4)),
        PrettyCapsuleButton(
          label: ksSendMessage,
          onPressed: sendMessage,
          icon: Icons.add,
          padding: context.symmetricPadding(
            h: s50,
            v: s18,
          ),
        ).addAlign(alignment: Alignment.centerRight),
      ]
          .addColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .addPadding(
            edgeInsets: context.symmetricPercentPadding(
              vPercent: s14,
              hPercent: s8,
            ),
          )
          .addScrollView(
            physics: const PageScrollPhysics(),
          ),
      showSnackBar().addAlign(alignment: Alignment.bottomCenter),
    ].addStack();
  }

  Widget showSnackBar() {
    return Visibility(
      visible: !_snackbarAnimationController.isDismissed,
      child: SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(
            curve: Curves.easeOutQuad,
            parent: _snackbarAnimationController,
          ),
        ),
        child: <Widget>[
          Icon(
            hasError ? kiError : kiSuccess,
            color: hasError ? kRed : kTeal,
            size: context.adaptive(s14, s24),
          ),
          horizontalSpaceLarge,
          Text(
            hasError
                ? (_contactVM.error.isEmpty
                    ? "Please fill the form first!"
                    : _contactVM.error)
                : "Your message has been sent!",
            style: context
                .adaptive(Theme.of(context).textTheme.bodySmall,
                    Theme.of(context).textTheme.bodyLarge)
                ?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: hasError ? kRed : kTeal,
                ),
          ),
        ]
            .addRow(
              mainAxisSize: MainAxisSize.min,
            )
            .addContainer(
              decoration: BoxDecoration(
                color: hasError ? kRed100 : kTeal200,
                borderRadius: BorderRadius.circular(s8),
              ),
              margin: context.percentPadding(
                b: s3,
              ),
              padding: context.symmetricPadding(
                h: s30,
                v: s14,
              ),
            ),
      ),
    );
  }
}

class ContactLabel extends StatelessWidget {
  const ContactLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context
          .adaptive(Theme.of(context).textTheme.bodyMedium,
              Theme.of(context).textTheme.labelLarge)
          ?.copyWith(
            fontWeight: FontWeight.w300,
          ),
    );
  }
}
