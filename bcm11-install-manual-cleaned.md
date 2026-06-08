| NVIDIA | Base Command | Manager | 11  |
| ------ | ------------ | ------- | --- |
Installation Manual
| Revision: | ace9b6c85  |     |     |
| --------- | ---------- | --- | --- |
| Date: Wed | Jun 3 2026 |     |     |

©2026NVIDIACorporation&affiliates. AllRightsReserved. This manual or parts there of may not be
reproduced in any form unless permitted by contractor by written permission of NVIDIA Corporation.
Trademarks
Linux is a registered trademark of Linus Torvalds. PathScale is a registered trademark of Cray, Inc.
Red Hat and all Red Hat-based trademarks are trademarks or registered trademarks of Red Hat, Inc.
SUSE is a registered trademark of SUSE LLC. NVIDIA, CUDA, GPUDirect, HPC SDK, NVIDIA DGX,
NVIDIANsight,and NV Link are registered trademarks of NVIDIA Corporation.FLEXlmisaregistered
trademark of Flex era Software,Inc. PBSProfessional,and Green Provisioning are trademarks of Altair
Engineering,Inc. All other trademarks are the property of the irrespective owners.
Rights and Restrictions
Allstatements,specifications,recommendations,and technical information contained here in are current
or planned as of the date of publication of this document. They are reliable as of the time of this writing
and are presented without warranty of any kind, expressed or implied. NVIDIA Corporation shall
not be liable for technical or editorial errors or omissions which may occur in this document. NVIDIA
Corporations hall not be liable for any damages resulting from the use of this document.
Limitation of Liability and Damages Pertaining to NVIDIA Corporation
The NVIDIA Base Command Manager product principally consists of free software that is licensed by
the Linux authors free of charge. NVIDIA Corporations hall have no liability nor will NVIDIA Corp o-
ration provide any warranty for the NVIDIA Base Command Manager to the extent that is permitted
bylaw. Unless confirmed in writing,theLinuxauthorsand/or third parties provide the program as is
withoutanywarranty,either expressed or implied,including,butnotlimitedto,marketabilityorsuit-
ability for a specific purpose. The user of the NVIDIA Base Command Manager product shall accept
the full risk for the quality or performance of the product. Should the product malfunction,thecostsfor
repair, service, or correction will be borne by the user of the NVIDIA Base Command Manager prod-
uct. No copyright owner or third party who has modified or distributed the program as permitted in
this licenses hall beheld liable for damages,including general or specific damages,damagescausedby
side effects or consequential damages,resulting from the use of the program or the un-usabilityofthe
program (including, but not limited to, loss of data, incorrect processing of data, losses that must be
bornebyyouorothers,or the inability of the program to work together with any other program),even
if a copyright owner or third party had been advised about the possibility of such damages unless such
copyright owner or third party has signed a writing to the contrary.

Table of Contents
TableofContents . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1 Quick start Installation Guide 7
1.1 Installing The Head Node . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
1.2 FirstBoot . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.3 BootingRegularNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.4 QuickstartForGPUs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
1.5 Optional: UpgradingPython . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
1.6 RunningBaseView . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
2 Introduction 19
2.1 What Is NVIDIA Base Command Manager? . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.1.1 What OS Platforms Is It Available For? . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.1.2 What Architectures Does It Run On? . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.1.3 What Features Are Supported PerO S And Architecture? . . . . . . . . . . . . . . . 20
2.1.4 What OS Platforms Can It Be Managed From? . . . . . . . . . . . . . . . . . . . . . 20
2.2 ClusterStructure . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
3 Installing NVIDIA Base Command Manager 23
3.1 Minimal Hardware Requirements. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
3.1.1 HeadNode . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
3.1.2 ComputeNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2 SupportedHardware . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.1 ComputeNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.2 EthernetSwitches . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.3 Power Distribution Units . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.4 Management Controllers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.2.5 In fin i Band And Similar . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.2.6 GPUs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.2.7 RAID . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.3 Head Node Installation: BareMetalMethod. . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.3.1 ISOBootMenu . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
3.3.2 WelcomeScreen . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
3.3.3 SoftwareLicenses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
3.3.4 Kernel Modules Configuration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
3.3.5 HardwareInfo . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
3.3.6 InstallationSource . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
3.3.7 ClusterSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
3.3.8 Workload Management Configuration . . . . . . . . . . . . . . . . . . . . . . . . . . 33
3.3.9 NetworkTopology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
3.3.10 HeadNodeSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37

4 TableofContents
3.3.11 Compute Nodes Settings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
3.3.12 BMCConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
3.3.13 Networks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
3.3.14 Headnodeinterfaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
3.3.15 Compute node interfaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
3.3.16 DiskLayout . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
3.3.17 DiskLayoutSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
3.3.18 AdditionalSoftware . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
3.3.19 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
3.3.20 Deployment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
3.3.21 Licensing And Further Configuration . . . . . . . . . . . . . . . . . . . . . . . . . . 50
3.4 Head Node Installation: AnsibleAdd-OnMethod . . . . . . . . . . . . . . . . . . . . . . . 50
3.4.1 AnOverviewOfAnsible . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51
3.4.2 TheHeadNodeAdd-on Installer And An sib le . . . . . . . . . . . . . . . . . . . . . 51
3.5 Enabling Remote Browser-Based Installation Via The Text Mode Installer . . . . . . . . . . 52
4 Licensing NVIDIA Base Command Manager 53
4.1 Displaying License Attributes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
4.1.1 Displaying License Attributes Within Base View . . . . . . . . . . . . . . . . . . . . 54
4.1.2 Displaying License Attributes Within cm sh . . . . . . . . . . . . . . . . . . . . . . . 55
4.2 VerifyingALicense—Theverify-licenseUtility . . . . . . . . . . . . . . . . . . . . . . . 55
4.2.1 Theverify-license Utility Can Be Used When license info Cannot Be Used . . 56
4.2.2 UsingTheverify-license Utility To Troubleshoot License Issues . . . . . . . . . 56
4.2.3 Using The version infoComm and To Verify The BC M Software Version. . . . . . 57
4.3 Requesting And Installing A License Using A Product Key . . . . . . . . . . . . . . . . . . 58
4.3.1 IsALicenseNeeded?—Verifying License Attributes . . . . . . . . . . . . . . . . . . 58
4.3.2 TheProductKey . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
4.3.3 Requesting A License With The request-licenseScript . . . . . . . . . . . . . . . 60
4.3.4 Installing A License With The install-licenseScript . . . . . . . . . . . . . . . . 61
4.3.5 Re-Installing A License After Replacing The Hardware . . . . . . . . . . . . . . . . 62
4.3.6 Re-Installing A License After Wiping Or Replacing The Hard Drive . . . . . . . . . 63
4.3.7 Re booting Nodes After An Install . . . . . . . . . . . . . . . . . . . . . . . . . . . . 63
4.3.8 Getting Help With Licensing Issues . . . . . . . . . . . . . . . . . . . . . . . . . . . 64
5 Linux Distributions That Use Registration 65
5.1 Registering A Red Hat Enterprise Linux Based Cluster . . . . . . . . . . . . . . . . . . . . 65
5.1.1 Registering AHead Node With RHEL . . . . . . . . . . . . . . . . . . . . . . . . . . 65
5.1.2 Registering A Software Image With RHEL . . . . . . . . . . . . . . . . . . . . . . . 66
5.2 Registering AS USE Linux Enterprise Server Based Cluster . . . . . . . . . . . . . . . . . . 66
5.2.1 Registering AHead Node With S USE . . . . . . . . . . . . . . . . . . . . . . . . . . 66
5.2.2 Registering A Software Image With S USE . . . . . . . . . . . . . . . . . . . . . . . . 67
6 Changing The Network Parameters Of The Head Node 69
6.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
6.2 Method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
6.3 Terminology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69

TableofContents 5
7 ThirdPartySoftware 73
7.1 ModulesEnvironment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
7.2 Shorewall. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
7.2.1 The Shore wall Service Paradigm . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
7.2.2 ShorewallZones,Policies,AndRules . . . . . . . . . . . . . . . . . . . . . . . . . . 74
7.2.3 Clear And Stop Behavior In service Options,bashShellCommand,AndcmshShell 75
7.2.4 AddingTo Shore wall Configuration Via A Role In cm sh . . . . . . . . . . . . . . . . 75
7.2.5 Further Shore wall Quirks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 77
7.3 TheGCCCompiler . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 78
7.4 AMD GPU Driver Installation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 78
7.4.1 AMDGPUHardwareCheck . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 79
7.4.2 AMD GPU Driver Installation Per Supported Distribution . . . . . . . . . . . . . . 79
8 TheNVIDIAHPCSDK 83
8.1 PackagesAndVersions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 83
8.2 CompilerModules . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 84
8.3 Viewing Installed Available CUDA Versions,And The Running CUDA Version . . . . . . 84
8.4 Changing The Running CUDA Version . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 85
9 CUDAForGPUs 87
9.1 InstallingCUDA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 87
9.1.1 CUDA Packages Available . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 87
9.1.2 CUDA Package And Modules . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 91
9.2 VerifyingCUDA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 92
9.3 VerifyingOpenCL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 94
9.4 NVIDIA Validation Suite(Package: cuda-dcgm-nvvs) . . . . . . . . . . . . . . . . . . . . . 95
9.5 Further NVIDIA Configuration Via The Cluster Manager . . . . . . . . . . . . . . . . . . . 97
10 OFEDSoftwareStack 99
10.1 Choosing A Distribution Version, Or A Non-distribution Version, Ensuring The Kernel
Matches,And Logging The Installation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 99
10.2 DOC A OF ED Stack Installation Using The BC M DOC A OF ED Installation Script . . . . . 99
11 BurningNodes 101
11.1 Test Scripts Deployment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
11.2 BurnConfigurations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
11.2.1 Burn Configuration Simple XML Example . . . . . . . . . . . . . . . . . . . . . . . 101
11.2.2 Burn Configuration XML Schema Definition . . . . . . . . . . . . . . . . . . . . . . 103
11.3 Running A Burn Configuration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 103
11.3.1 Burn Configuration And Execution In cm sh . . . . . . . . . . . . . . . . . . . . . . . 103
11.3.2 WritingATestScript . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 109
11.3.3 BurnFailures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 112
11.4 Relocating The Burn Logs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 113
11.4.1 Configuring The Relocation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 113
11.4.2 Testing The Relocation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 114

6 TableofContents
12 Installing And Configuring SELinux 117
12.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
12.2 Enabling SELinux On RHEL8,Rocky9 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
12.2.1 Setting SELinux Parameters . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
12.2.2 Setting UpOn The Head Node . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
12.2.3 Setting UpOn The Regular Nodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
A OtherLicenses,Subscriptions,OrSupportVendors 121
B Hardware Recommendations 123
B.1 Heuristics For Requirements. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 123
B.1.1 Heuristics For Requirements For A Regular Node . . . . . . . . . . . . . . . . . . . 123
B.1.2 Heuristics For Requirements For AHead Node . . . . . . . . . . . . . . . . . . . . 123
B.2 Observed Head Node Resources Use,And Suggested Specification . . . . . . . . . . . . . 124
B.2.1 Observed Head Node Example CM Daemon And MySQL Resources Use . . . . . 124
B.2.2 Suggested Head Node Specification For Clusters Beyond1000Nodes . . . . . . . 124
C BC M And NVIDIA A I Enterprise 125
C.1 Certified Features Of BC M For NVIDIA A I Enterprise . . . . . . . . . . . . . . . . . . . . . 125
C.2 NVIDIA A I Enterprise Compatible Servers . . . . . . . . . . . . . . . . . . . . . . . . . . . 125
C.3 NVIDIA Software Versions Supported . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 125
C.4 NVIDIA A I Enterprise Product Support Matrix . . . . . . . . . . . . . . . . . . . . . . . . . 126
D NVIDIA BC M Scope Of Support 127
D.1 Included In BC M Support . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 127
D.1.1 Support For Cluster Installation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 127
D.1.2 Support For Cluster Configuration . . . . . . . . . . . . . . . . . . . . . . . . . . . . 127
D.1.3 Support For Integration Of Cluster In Site Infrastructure . . . . . . . . . . . . . . . 127
D.1.4 Support For Integration With Microsoft Active Directory . . . . . . . . . . . . . . . 127
D.1.5 SupportForFirst-PartyHardwareOnly . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.1.6 Support For Software Upgrades . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2 Excluded From BC M Support . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.1 HelpWithThird-PartySoftware . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.2 Help With User Applications . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.3 Help With Workload Management . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.4 Help With Performance Issues . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.5 Root-CauseAnalysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.6 PhoneSupport . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.3 Support Outside Of The Standard Scope—Getting Professional Services . . . . . . . . . . 129

1
Quickstart Installation Guide
This chapter describes a basic and quick installation of NVIDIA Base Command Manager (BCM) on
“baremetal”cluster hardware as a step-by-stepprocess, and gives very little explanation of the steps.
Following these steps should allow a moderately experienced cluster administrator to get a cluster up
and running in a fairly standard configuration as quickly as possible. This would be without even
having to read the introductory Chapter 2 of this manual, let alone the entire manual. References to
chapters and sections are provided where appropriate.
Someasides,before getting on with the steps themselves:
• If the cluster has already been installed, tested, and configured, but only needs to be configured
nowforanewnetwork,then the administrator should only need to look at Chapter6. Chapter6
lays out how to carryout the most common configuration changes that usually need to be done to
make the cluster work in the new network.
• For administrators that are very unfamiliar with clusters, reading the introduction (Chapter 2)
and then the more detailed installation walk through for a bare metal installation(Chapter3,sec-
tions 3.1, 3.2, and 3.3) is recommended. Having carried out the head node installation, the ad-
mini strat or can then return to this quick start chapter(Chapter1), and continue onward with the
quick start process of regular node installation(section1.3).
• The configuration and administration of the cluster after it has been installed is covered in the
BC M Administrator Manual. The Administrator Manual should be consulted for further background
information as well as guidance on cluster administration tasks,after the introduction(Chapter2)
of the Installation Manual has been read.
• If all else fails, administrator-level support is available via https://www.nvidia.com/en-us/
data-center/bright-cluster-manager/support/. Section 14.2 of the Administrator Manual has
further details on how to brief the support team, so that the issue can be resolved as quickly as
possible.
The quick start steps now follow:
1.1 Installing The Head Node
The head node does not need to be connected to the regular nodes at this point,thoughithelpstohave
the wiring done beforehand so that how things are connected is known.
1. The BIOS of the head node should have the local time set.
2. The head node should be booted from the BC M installation DVD or from a USB flash drive with
theDVDISOonit.

8 Quick start Installation Guide
3. The option: Start Base Command Manager Graphical Installer, or Start Base Command
ManagerText Installer, should be selected in the text boot menu. The graphical installation
isrecommended,and brings up the GUI installation welcome screen. The text installer provides a
minimalncurses-based version of the GUI installation.
Only the GUI installation is discussed in the rest of this quick start for convenience.
4. At the GUI welcome screen,theStart installation button should be clicked.
5. AttheEULAscreens:
• At the NVIDIA EU LA screen,the acceptance check box should be ticked. Nextshouldthenbe
ticked.
• At the Linux base distribution EU LA screen,the acceptance check box should be ticked. Next
shouldthenbeclicked.
6. AttheKernel modulesscreen,Nextshouldbeclicked.
7. At the Hardware info screen, the detected hardware should be reviewed. If additional kernel
modulesarerequired,then the administrator should go back to the Kernel Modulesscreen. Once
all the relevant hardware(Ethernetinterfaces,hard drive and DVD drive)isdetected,Nextshould
beclicked.
8. At the Installation source screen, the DVD drive containing the BCM DVD, or the USB flash
drive containing the DVD ISO,shouldbeselected,thenNextclicked.
9. At the General cluster settings screen, one or more nameservers and one or more domains
canbeset,if they have not already been automatically filled. The remaining settings can usually
beleftasis.
10. AttheWorkload managementscreen,an HPC workload manager can be selected. Thechoicecan
bemadelaterontoo,after BC M has been installed.
11. FortheNetwork topologyscreen,aType1network is the most common.
12. FortheHead node settingsscreen,the head is given a name and a password.
13. FortheCompute nodes settingsscreen,the head is given a name and a password.
• The number of racks and regular nodes are specified
• The base name for the regular nodes is set.Accepting the default of node means nodes names
areprefixedwithnode,forexample: node001,node002...
• The number of digits to append to the base name is set. Forexample,accepting the default of
3meansnodesfromnode001tonode999arepossiblenames.
• The correct hardware manufacturer is selected
14. For the BMC configuration screen, the use of IPMI/iLO/DRAC/CIMC/Redfish BMCs is
carried out. Adding an IPMI/iLO/DRAC/CIMC/Redfish network is needed to configure
IPMI/iLO/DRAC/CIMC/Red fish interfaces in a different IP subnet,andisrecommended.
15. AttheNetworksscreen,the network parameters for the head node should be entered for the inter-
face facing the network named external net:
• If using DHCP on that interface, the parameters for IP Address, Netmask and Gateway as
suggested by the DHCP server on the external network can be accepted.
• If not using DHCP on that interface,static values put in instead.

1.1Installing The Head Node 9
The network parameters for external net that can be set include the:
• baseaddress(also called the network address)
• netmask
• domainname
The network external net corresponds to the site network that the cluster resides in(forexample,
a corporate or campus network). The IP address details are therefore the details of the head node
foratype1externalnetnetwork(figure3.10). A domain name should be entered to suit the local
requirements.
16. For the Head node interfaces screen, the head node network interfaces are assigned networks
andIPaddresses. The assigned values can be reviewed and changed.
17. AttheCompute node interfacesscreen,the compute node interfaces are assigned networks and
IPaddresses. The assigned values can be reviewed and changed.
18. AttheDisk layoutscreen,a drive should be selected for the head node. The installation will be
doneontothisdrive,overwriting all its previous content.
19. AttheDisk layout Settingsscreen, the administrator can modify the disk layout for the head
nodebyselectingapre-definedlayout.
For hard drives that have less than about 500GB space, the XML file
master-one-big-partition.xml in the installer filesystem is used by default:
| Partition | Space MountedAt | FilesystemType |
| --------- | --------------- | -------------- |
| 1         | 1G /boot        | ext2           |
| 0         | 100M /boot/efi  | fat            |
| 2         | 16G -           | swap           |
| 3         | rest /          | xfs            |
Default layout for up to500GB:Onebigpartition.
For hard drives that have about 500GB or more of space, the XML file master-standard.xml is
usedbydefault:
| Partition | Space MountedAt | FilesystemType |
| --------- | --------------- | -------------- |
| 1         | 1G /boot        | ext2           |
| 0         | 100M /boot/efi  | fat            |
| 2         | 16G -           | swap           |
| 3         | 20G /tmp        | xfs            |
| 4         | 180G /var       | xfs            |
| 5         | rest /          | xfs            |
Default layout for more than500GB:Severalpartitions.
The layouts indicated by these tables maybe fine-tuned by editing the XML partitioning definition
duringthisstage.The“max”setting in the XML file corresponds to the“rest”entryinthesetables,
and means the rest of the drive space is used up for the associated partition,whatevertheleftover
spaceis.
There are layout templates available from a menu,other than the preceding default layouts.

10 Quick start Installation Guide
20. AttheAdditional softwarescreen,extra software options can be chosen for installation if these
were selected for the installation ISO.The extra software options are:
• CUDA
• OFEDstack
21. The Summary screen should be reviewed. A wrong entry can still be fixed at this point. TheNext
button then starts the installation.
22. The Deployment screen should eventually complete. Clicking on Reboot reboot s the head node.
1.2 First Boot
1. The DVD should be removed or the boot-order altered in the BIOS to ensure that the head node
boots from the first hard drive.
2. Once the machine is fully booted, a login should be done as root with the password that was
entered during installation.
3. A check should be done to confirm that the machine is visible on the external network. Also, it
should be checked that the second NIC(i.e. eth1)is physically connected to the external network.
4. If the parent distribution for BC MisR HE LandS USE then registration(Chapter5)shouldusually
bedone.
5. The license parameters should be verified to be correct:
cmsh -c "main licenseinfo"
If the license being used is a temporary license (see End Time value), a new license should be
requested well before the temporary license expires. The procedure for requesting and installing
a new license is described in Chapter4.
6. The head node software should be updated via its package manager (yum, dnf, apt, zypper) so
that it has the latest packages(sections9.2-9.3of the Administrator Manual).
1.3 Booting Regular Nodes
1. A check should be done to make sure the first NIC (i.e. eth0) on the head node is physically
connected to the internal cluster network.
2. The BIOS of regular nodes should be configured to boot from the network. The regular nodes
should then be booted. No operating system is expected to be on the regular nodes already. If
there is an operating system there already, then by default, it is overwritten by a default image
provided by the head node during the next stages.
3. If everything goes well,thenode-installer component starts on each regular node and a certificate
request is sent to the head node.
If a regular node does not make it to the node-installer stage, then it is possible that additional
kernel modules are needed. Section5.8of the Administrator Manual contains more information on
how to diagnose problems during the regular node booting process.
4. To identify the regular nodes(thatis,to assign a hostname to each physical node),severaloptions
areavailable. Which option is most convenient depends mostly on the number of regular nodes
andwhethera(configured)managed Ethernet switch is present.
Rather than identifying nodes based on their MAC address, it is often beneficial (especially in
largerclusters)to identify nodes based on the Ethernet switch port that they are connected to. To

1.3BootingRegularNodes 11
allow nodes to be identified based on Ethernet switch ports,section3.8of the Administrator Manual
shouldbeconsulted.
If anode is unidentified,then its node console displays an ncurses message to indicate it is a nun-
knownnode,and the net boot keeps retrying its identification attempts. Anyone of the following
methods maybe used to assign node identities when nodes startup as unidentified nodes:
a. Identifying each node on the node console: To manually identify each node,the“Manually
select node”option is selected for each node. The node is then identified manually by se-
Accept
lecting a node-entry from the list, choosing the option. This option is easiest when
there are not many nodes. It requires being able to view the console of each node and key-
board entry to the console.
b. Identifying nodes using cmsh: In cmsh the newnodes command in device mode (page 255,
section 5.4.2 of the Administrator Manual) can be used to assign identities to nodes from the
command line. When called without parameters, the newnodes command can be used to
verify that all nodes have booted into the node-installer and are all waiting to be assigned an
identity.
c. Identifying nodes using Base View:The node identification resource(page259,section5.4.2
of the Administrator Manual) in Base View automates the process of assigning identities so
that manual identification of nodes at the console is not required.
Example
To verify that all regular nodes have booted into the node-installer:
| [root@mycluster   | ~]# cmsh                 |               |                         |                |
| ----------------- | ------------------------ | ------------- | ----------------------- | -------------- |
| [mycluster]%      | device newnodes          |               |                         |                |
| MAC               | First                    | appeared      | Detected                | on switch port |
| ----------------- | ------------------------ |               | ----------------------- |                |
| 00:0C:29:D2:68:8D | 05 Sep                   | 2011 13:43:13 | PDT [no                 | port detected] |
| 00:0C:29:54:F5:94 | 05 Sep                   | 2011 13:49:41 | PDT [no                 | port detected] |
...
| [mycluster]%      | device newnodes     | | wc -l  |                         |                |
| ----------------- | ------------------- | -------- | ----------------------- | -------------- |
| MAC               | First               | appeared | Detected                | on switch port |
| ----------------- | ------------------- |          | ----------------------- |                |
32
| [mycluster]%    | exit |     |     |     |
| --------------- | ---- | --- | --- | --- |
| [root@mycluster | ~]#  |     |     |     |
Example
Once all regular nodes have been booted in the proper order,the order of their appearance on the
network can be used to assign node identities. To assign identities node001 through node032 to
thefirst32nodesthatwerebooted,the following commands maybe used:
| [root@mycluster   | ~]# cmsh                      |          |                  |             |
| ----------------- | ----------------------------- | -------- | ---------------- | ----------- |
| [mycluster]%      | device newnodes               | -s -n    | node001..node032 |             |
| MAC               | First                         | appeared |                  | Hostname    |
| ----------------- | ----------------------------- |          |                  | ---------   |
| 00:0C:29:D2:68:8D | Mon, 05                       | Sep 2011 | 13:43:13         | PDT node001 |
| 00:0C:29:54:F5:94 | Mon, 05                       | Sep 2011 | 13:49:41         | PDT node002 |
...
| [mycluster]%    | exit |     |     |     |
| --------------- | ---- | --- | --- | --- |
| [root@mycluster | ~]#  |     |     |     |

12 Quick start Installation Guide
5. Each regular node is now provisioned and eventually fully boots. For troubleshooting node boot-
ingissues,section5.8of the Administrator Manual should be consulted.
6. Optional: To configure node-level power management, Chapter 4 of the Administrator Manual
shouldbeconsulted.
7. To update the software on the nodes, a package manager is used to install to the node image
filesystem that is on the head node.
The node imagefile system should be updated via its package manager(yum,dnf,apt,zypper)so
that it has the latest packages(sections9.4-9.5of the Administrator Manual).
1.4 Quickstart For GPUs
This assumes that the head nodes and regular nodes are up and running. Getting GPUs set upright can
be done as follows for atypical installation:
1. GPU Hardware And Sanity Check
If the hardware is not detected, then that must first be fixed. Checking for the hardware can be
doneasfollows:
(a) NVIDIA GPU hardware should be detected on the nodes that use it. ThisistrueforNVIDIA
GPU units (separate from the nodes) as well as for on-board NVIDIA GPUs. The lspci
command can be used for detection. Forexample,the presence of GPU hardware on node001
can be detected by the kernel, even if its associated kernel module software drivers are not
loaded:
Example
[root@basecm11 ~]# ssh node001 lspci | grep NVIDIA
00:07.0 3D controller: NVIDIA Corporation GK110BGL [Tesla K40c] (rev a1)
If there is no 3D controller string, then it typically means that the GPU is too old to be
supported,or that there is no GPU actually there. Typically,each GPU display saline,corre-
s pond ing to its location on the PCI bus. So4GPUs on anode would show4lines.
Supported GPU architectures at the time of writing (May 2026) are Turing, Ampere, Ada
Lovelace,Hopper,andBlackwell.
(b) AMD CPUs, which have a GPU integrated with the CPU, the CPU chip can similarly be
identifiedwithlscpu:
Example
[root@basecm11 ~]# ssh node001 lscpu | grep "Model name:"
Model name: AMD Ryzen 5 2500U with Radeon Vega Mobile Gfx
The AMD chips can then be checked against the list of AMD chips with AMD GPUs,aslisted
athttps://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-18-20
2. Installing The Software
(a) Details of AMD GPU software installation are given in section7.4.
(b) ForNVIDIAGPUs, assuming the GPU is on the compute node node001, andthatthehard-
ware is supportedby CUDA 13.0, thensoftware installation is carriedout at the head node
asfollows:

1.4QuickstartForGPUs 13
i. CUDAtoolkit,software development kit,and visual tools are installed on the head node
itselfwith:
Example
root@basecm11:~# apt install cuda13.0-toolkit cuda13.0-sdk cuda13.0-visual-tools
ii. By default, the image (/cm/images/default-image) used by nodes already has the re-
quired NVIDIA driver software packages installed. These therefore do not need to be
installedexplicitly.
Further details on the basic installation of CUDA for NVIDIA GPUs are given in Chap-
ter9.
3. Configuring GPUs For The Cluster Manager
After the GPU software has been installed,the gpu settings sub mode can be used under device
mode for the nodes that have GPUs.This sub mode allows the cluster administrator to modify GPU
values. Keeping the default settings in the sub mode should be fine,which means configuration of
GPU settings can simply be skipped.
However,ifneeded,then the settings can be modified as described in section3.16.2oftheAdmin-
istratorManual,
(a) onpage182forNVIDIAGPUs
(b) onpage185forAMDGPUs.
4. Configuring GPUs For The Workload Manager
A workload manager can be setup from the head node by running:
[root@basecm11 ~]# cm-wlm-setup
This starts up a TUI configuration. An NVIDIA GPU can be configured via for Slurm using the
Setup (Step by Step)optionforSlurm(section7.3.2of the Administrator Manual).
After configuring the WLM server, WLM submission and WLM client roles for the nodes of the
cluster,a screen that asks if GPU resources should be configured is displayed(figure1.1):
Figure1.1: SlurmWithcm-wlm-setup: GPU Configuration Entry Screen
Following through brings up a GPU device settings configuration screen(figure1.2):
Figure1.2: SlurmWithcm-wlm-setup: GPU Device Settings Configuration Screen

14 Quick start Installation Guide
The help text option in the screen gives hints based on the descriptions at https://slurm.schedmd.
| com/gres.conf.html,and also as seen in Slur m’sman |     |     | gres.conf.5. |
| -------------------------------------------- | --- | --- | ------------ |
Figure1.2shows2physical GPUs on the node being configured. The type is an arbitrary string for
theGPU,and each CPU core is allocated an alias GPU device.
Thenextscreen(figure1.3)allows the NVIDIA CUDA MPS(Multi-ProcessService)tobeconfig-
ured:
Configuring An NVIDIA GPU For Slur m With cm-wlm-setup:
Figure1.3: MPS Settings Configuration
Screen
The help text for this screen gives hints on how the fields can be filled in. The number of GPU
cores(figure1.3)for a GPU device can be set.
Therestofthecm-wlm-setup procedure can then be completed.
The regular nodes that had a role change during cm-wlm-setup can then be re booted to pickup the
workloadmanager(WLM)services. A check via the cm sh command ds should show what nodes
needarestart.
Example
’ ’
| [root@basecm11 | ~]# cmsh | -c ds |     |
| -------------- | -------- | ----- | --- |
node001 ... [ UP ], restart required (cm-wlm-setup: compute role assigned)
node002 ... [ UP ], restart required (cm-wlm-setup: compute role assigned)
...
If,forexample,therangefromnode001tonode015needs to be restarted to get the W LM services
running,then it could be carried out with:
Example
’ ’
| [root@basecm11 | ~]# cmsh | -c device; reboot | -n node001..node015 |
| -------------- | -------- | ----------------- | ------------------- |
NVIDIA configuration for Slurm and other workload managers is described in further detail in
section7.5of the Administrator Manual
5. RunningAGPUSlurmJob
A user can be created with,forexample,an unimaginative name such as a user:
| [root@basecm11             | ~]# cmsh       |              |     |
| -------------------------- | -------------- | ------------ | --- |
| [basecm11]%                | user add auser |              |     |
| [basecm11->user*[auser*]]% |                | set password |     |
| enter new password:        |                |              |     |
| retype new                 | password:      |              |     |
| [basecm11->user*[auser*]]% |                | ..           |     |
| [basecm11->user*]%         | commit         |              |     |

| 1.5Optional: | UpgradingPython |     |     |     | 15  |
| ------------ | --------------- | --- | --- | --- | --- |
The “Hello World” helloworld.cu script from section 7.5.4 of the User Manual can be saved in
auser’sdirectory,and then compiled for a GPU with nvc c:
| [auser@basecm11 |     | ~]$ | module load        | shared cuda12.3/toolkit |     |
| --------------- | --- | --- | ------------------ | ----------------------- | --- |
| [auser@basecm11 |     | ~]$ | nvcc helloworld.cu | -o helloworld           |     |
Aslurmgpuhello.sh batch script can be built as follows:
| [auser@basecm11 |     | ~]$ | cat slurmgpuhello.sh |     |     |
| --------------- | --- | --- | -------------------- | --- | --- |
#!/bin/sh
| #SBATCH | -o                  | my.stdout |                |                |     |
| ------- | ------------------- | --------- | -------------- | -------------- | --- |
| #SBATCH | --time=30           |           | #time limit    | to batch job   |     |
| #SBATCH | --ntasks-per-node=1 |           |                |                |     |
| #SBATCH | -p                  | defq      | #assuming      | gpu is in defq |     |
| #SBATCH | --gpus=1            |           |                |                |     |
| echo    | -n "hostname        |           | is "; hostname |                |     |
| module  | clear               | -f        |                |                |     |
./helloworld
It can be submitted as a batch job from the head node:
| [auser@basecm11 |       | ~]$ | module load             | slurm |     |
| --------------- | ----- | --- | ----------------------- | ----- | --- |
| [auser@basecm11 |       | ~]$ | sbatch slurmgpuhello.sh |       |     |
| Submitted       | batch | job | 35                      |       |     |
The output from submission to anode with a GPU can then be seen:
| [auser@basecm11 |         | ~]$            | cat my.stdout       |        |     |
| --------------- | ------- | -------------- | ------------------- | ------ | --- |
| hostname        | is      | node001        |                     |        |     |
| String          | for     | encode/decode: | Hello               | World! |     |
| String          | encoded | on             | CPU as: Uryy|-d|yq. |        |     |
| String          | decoded | on             | GPU as: Hello       | World! |     |
| [auser@basecm11 |         | ~]$            |                     |        |     |
More about Slur m batch scripts and GPU compilation can be found in Chapter7oftheUserMan-
ual.
| 1.5 Optional: |     | Upgrading | Python |     |     |
| ------------- | --- | --------- | ------ | --- | --- |
The version of Python provided by the Linux-based OS distributors typically lags significantly behind
the latest upstream version. This is normally a good thing, since the distributors provide integration,
and carryout testing to make sure that it works well with the rest of the OS.
Some BCM tools and packages rely on some of the later features of Python, and by default BCM
installs its own later Python version via a package dependency when needed. So explicit upgrades
to Python are not needed for BCM itself. For example, for Rocky Linux 9.5, the default (distribution)
version of Python at the time of writing(June2025)isPythonversion3.9,whileBCMversion11installs
and deploys a Python version3.12whenneeded.
However,some cluster administrators would also like to have various Python versions available on
their cluster for user applications. For example, because users too would like to use later versions for
theirnicerfeatures. BC M therefore makes these various versions of Python available for the end user in
anintegratedmanner,as an optional installation.
For example, for NVIDIA Base Command Manager version 11.0, the Python packages that can be
installed from the cluster manager repository are:

16 Quick start Installation Guide
• cm-python39,forPython3.9
• cm-python311,forPython3.11
• cm-python312,forPython3.12
If the packages are installed,then users can use the modules command to switch the environment to the
appropriate Python version. Forexample,a user fred can switch to Python3.12with:
| [fred@basecm11 | ~]$ python | -V  |     |     |
| -------------- | ---------- | --- | --- | --- |
Python 3.9.18
| [fred@basecm11 | ~]$ module | load python312 |     |     |
| -------------- | ---------- | -------------- | --- | --- |
| [fred@basecm11 | ~]$ python | -V             |     |     |
Python 3.12.11
If the change is carried out correctly, then support is not available for Python-related bugs, but is
availableforBCM-relatedfeatures.
The J up y ter module is an example of a module that automatically loads its own version of Python.
This may cause confusion if the system administrator is not paying attention to which version of Python
isactive.Forexample,inBCM11.0,withRocky9.5,if the user is using the distribution version of Python
3.9, and then Jupyter is loaded, the Python version used changes to 3.12 as it automatically loads the
python312module:
Example
| [root@basecm11   | ~]# module   | list |     |     |
| ---------------- | ------------ | ---- | --- | --- |
| Currently Loaded | Modulefiles: |      |     |     |
1) shared 2) cmsh 3) cmd 4) cluster-tools/master 5) cm-setup/master 6) cm-image/master
| [root@basecm11 | ~]# python | -V  |     |     |
| -------------- | ---------- | --- | --- | --- |
Python 3.9.19
| [root@basecm11 | ~]# module | load jupyter |     |     |
| -------------- | ---------- | ------------ | --- | --- |
Loading jupyter/16.0.6
| Loading requirement: |            | python312 |     |     |
| -------------------- | ---------- | --------- | --- | --- |
| [root@basecm11       | ~]# python | -V        |     |     |
Python 3.12.11
| [root@basecm11      | ~]# module  | remove python312 |                 |         |
| ------------------- | ----------- | ---------------- | --------------- | ------- |
| Unloading python312 |             |                  |                 |         |
| ERROR: python312    | cannot      | be unloaded      | due to a        | prereq. |
| HINT: Might         | try "module | unload           | jupyter/16.0.6" | first.  |
| 1.6 Running         | Base        | View             |                 |         |
To run Base View on the cluster from a workstation running X11: A recent web browser should be
used,andpointedto
https://<headnodeaddress>:8081/base-view/
A suitable web browser is the latest Chrome from Google, butOpera, Firefox, Chromium, andsimilar
should all also just work. The hardware on which the browser runs should be reasonably modern.
The cluster should now be ready for running compute jobs.
Formoreinformation:
• Thismanual,the Installation Manual,has more details and background on the installation of
the cluster in the next chapters.
• The Upgrade Manual describes upgrading from earlier versions of NVIDIA Base Command
Manager.

1.6RunningBaseView 17
• The Administrator Manual describes the general management of the cluster.
• The User Manual describes the user environment and how to submit jobs for the end user
• The Cloud bursting Manual describe show to deploy the cloud capabilities of the cluster.
• The Developer Manual has useful information for developers who would like to program with
BCM.
• The Container iz ation Manual describe show to manage containers with BC M.
• The NVIDIA Mission Control Manual describes NVIDIA Mission Control capabilities and in-
tegrationwithBCM.

2
Introduction
This chapter introduces some features of NVIDIA Base Command Manager and describes a basic cluster
in terms of its hardware.
2.1 What Is NVIDIA Base Command Manager?
NVIDIA Base Command Manager11is a cluster management application built on top of major Linux
distributions.
2.1.1 What OS Platforms Is It Available For?
BC Mis available for the following OS platforms:
• Red Hat Enterprise Linux Server and some derivatives,suchasRockyLinux
– Versions8.x
– Versions9.x.
• SLESversions:
– S USE Enterprise Server15
• Ubuntuversions:
– JammyJellyfish22.04
– NobleNumbat24.04
– DGXOS7(describedathttps://docs.nvidia.com/dgx/dgx-os-7-user-guide/introduction.
html)
Typically BCM is installed either on a head node, or on a pair of head nodes in a high availability
configuration. Images are provisioned to the non-head nodes from the head node(s). The OS for the
images is by default the same as that of the head node(s),but the OS used for the images can be changed
lateron(section9.6of the Administrator Manual).
At the time of writing of this section in September2023,the OS platforms listed all support NVIDIA
AIEnterprise(https://docs.nvidia.com/ai-enterprise/index.html),with the exception for now of
RHEL9andderivatives.
2.1.2 What Architectures Does It Run On?
Within the distributions listed in section2.1.1,the BC M application runs on the following architectures:
• onthex86_64architecture that is supported by Intel and AMD64-bitCPUs
• onthearm64(AArch64)architecture that is supported by ARM v8CPUs

20 Introduction
2.1.3 What Features Are Supported PerO S And Architecture?
BCM aims to run so that it is independent of the chosen OS and architecture. That is, it aims to work
the same way for each OS or architecture. There are necessarily some limitations to this,andtheseare
documented in a feature matrix at https://service.bcm.nvidia.com/feature-matrix/.
2.1.4 What OS Platforms Can It Be Managed From?
While BC M runs directly on the OS platforms listed in section2.1.1,BC M can be managed from many
moreOSplatforms,when controlled by these frontend s:
• Base View (section 2.4 of the Administrator Manual): a GUI which conveniently runs on modern
desktop web browsers, and therefore on all operating system versions that support a modern
browser. This includes Microsoft Windows,MacOSandiOS,andLinux.
• cmsh(section2.5of the Administrator Manual): an interactive shell frontend that can be accessed
from any computing device with a secured SSH terminal access.
2.2 Cluster Structure
Initsmostbasicform,a cluster running BC M contains:
• One machine designated as the head node
• Several machines designated as compute nodes
• Oneormore(possiblymanaged)Ethernetswitches
• One or more power distribution units(Optional)
The head node is the most important machine within a cluster because it controls all other devices,
suchascomputenodes,switches and power distribution units. Furthermore,the head node is also the
hostthatallusers(including the administrator)login to in a default cluster. The head node is typically
the only machine that is connected directly to the external network and is usually the only machine in a
cluster that is equipped with a monitor and keyboard. The head node provides several vital services to
therestofthecluster,such as central data storage,workloadmanagement,usermanagement,DNSand
DHCPservice. The head node in a cluster is also frequently referred to as the master node.
Often,the head node is replicated to a second head node,frequently called a passive head node. If
the active head node fails,the passive head node can become active and takeover. Thisisknownasa
high availability setup,and is atypical configuration(Chapter15of the Administrator Manual)inBCM.
A cluster normally contains a considerable number of non-head, or regular nodes, also referred to
simplyasnodes. Theheadnode,notsurprisingly,manages these regular nodes over the network.
Most of the regular nodes are compute nodes. Compute nodes are the machines that will do the heavy
work when a cluster is being used for large computations. In addition to compute nodes,largerclusters
may have other types of nodes as well (e.g. storage nodes and login nodes). Nodes typically install
automatically through the (network bootable) node provisioning system that is included with BCM.
Every time a compute node is started, the software installed on its local hard drive is synchronized
automatically against a software image which resides on the head node. This ensures that a node can
always be brought back to a“knownstate”. The node provisioning system greatly eases compute node
administration and makes it trivial to replace an entire node in the event of hardware failure. Software
changes need to be carried out only once(inthesoftwareimage),and can easily be undone. Ingeneral,
there will rarely be a need to log on to a compute node directly.
Inmostcases, a cluster has a private internal network, which is usually built from one or multiple
managed Gigabit Ethernet switches,or made up of an In fin i Band or Omni-Pathfabric. Theinternalnet-
work connects all nodes to the head node and to each other.Compute nodes use the internal network for
booting,data storage and inter process communication. In more advanced cluster setups,theremaybe

2.2ClusterStructure 21
several dedicated networks. It should be noted that the external network—which could be a university
campusnetwork,company network or the Internet—is not normally directly connected to the internal
network. Instead,only the head node is connected to the external network.
Figure2.1illustrates atypical cluster network setup.
Figure2.1: Clusternetwork
Most clusters are equipped with one or more power distribution units. These units supply power to
all compute nodes and are also connected to the internal cluster network.The head node in a cluster can
use the power control units to switch compute nodes on or off.Fromtheheadnode,itisstraightforward
topoweron/off a large number of compute nodes with a single command.

3
Installing NVIDIA Base
Command Manager
This chapter describes in detail the installation of NVIDIA Base Command Manager on to the head node
ofacluster. Sections3.1and3.2list hardware requirements and supported hardware. Section3.3gives
step-by-step instructions on installing BCM from a DVD or USB drive onto a head node that has no
operating system running on it initially, while section 3.4 gives instructions on installing onto a head
node that already has an operating system running on it.
Once the head node is installed, the other, regular, nodes can (network) boot off the head node
and provision themselves from it with a default image, without requiring a Linux distribution DVD
or USB drive themselves. Regular nodes normally have any existing data wiped during the process of
provisioning from the head node,which means that a faulty drive can normally simply be replaced by
taking the regular node offline, replacing its drive, and then bringing the node back online, without
special reconfiguration. The details of the network boot and provisioning process for the regular nodes
are described in Chapter5of the Administrator Manual.
The installation of software on an already-configured cluster running BC Mis described in Chapter9
of the Administrator Manual.
3.1 Minimal Hardware Requirements
The following are minimal hardware requirements, suitable for a cluster of one head node and two
regularcomputenodes:
3.1.1 HeadNode
• x86-64,orARMv8CPU
• For running the application software:
– 4GBRAMforthex86architecture1
– 16GBRAMfortheARMv8architecture,
• 80GBdiskspace
• 2GigabitEthernetNICs(for the most common Type1topology(section3.3.9))
• DVDdriveorUSBdrive
1Thevalueof4GBRAMforthex86headnode,while technically correct as a minimum for running the application,isgen-
e rally not a practical minimum when carrying out a standard installation. This is because the standard bare-metalinstallation
(section3.3)runsbestwithatleast8GBRAM.

24 Installing NVIDIA Base Command Manager
3.1.2 ComputeNodes
• x86-64,ARMv8CPU
• 1GBRAM(atleast4GB is recommended for disk less nodes)
• 1GigabitEthernetNIC
Recommended hardware requirements for larger clusters are discussed in detail in Appendix B.
3.2 Supported Hardware
An NVIDIA-certified for AI enterprise system is a system with NVIDIA GPUs and networking
that has passed a set of certification tests to validate its performance, reliability, and scale for
data centers. Many system builders that have partnered with NVIDIA can provide such certi-
fied hardware. These system builders are listed in https://www.nvidia.com/en-us/data-center/
data-center-gpus/qualified-system-catalog.
The following hardware is also supported,even if it may not be NVIDIA-certified for A I Enterprise:
3.2.1 ComputeNodes
• ASUS
• Atos
• Cisco
• DellEMC
• Fujitsu
• HPE(Hewlett Packard Enterprise)
• IBM
• Lenovo
• NVIDIADGX
• Oracle
• Supermicro
Other brands are also expected to work,even if not explicitly supported.
3.2.2 EthernetSwitches
• Cisco
• Dell
• HP Networking Switches
• Netgear
• Supermicro
Other brands are also expected to work,although not explicitly supported.
3.2.3 Power Distribution Units
• APC(American Power Conversion)SwitchedRackPDU
Other brands with the same SNMP MIB mappings are also expected to work,although not explicitly
supported.

3.3Head Node Installation: BareMetalMethod 25
3.2.4 Management Controllers
• HPiLO
• iDRAC
• IPMI1.5/2.0
• CIMC
• Redfishv1
3.2.5 In fin i Band And Similar
• NVIDIA(formerlyMellanox)HCAs,and most other In fin i Band HC As
• NVIDIA(formerlyMellanox),and most other In fin i Band switches
3.2.6 GPUs
• NVIDIA GPUs later than Volta,with latest recommended drivers
• NVIDIADGXOS7
• AMD Radeon GPUs, as listed at https://support.amd.com/en-us/kb-articles/Pages/
Radeon-Software-for-Linux-Release-Notes.aspx
The GPUs that are NVIDIA-certified for A I Enterprise are listed in the support matrix at https://docs.
nvidia.com/ai-enterprise/latest/product-support-matrix/index.html#support-matrix.
3.2.7 RAID
Software or hardware RAID are supported. Fake RAID is not regarded as a serious production option
and is supported accordingly.
3.3 Head Node Installation: Bare Metal Method
A bare metal installation, that is, installing the head node onto a machine with no operating system
on it already, is the recommended option. This is because it cannot run into issues from an existing
configuration. An operating system from one of the ones listed in section2.1is installed during a bare
metalinstallation. The alternative to a bare metal installation is the add-on installation of section3.4.
Justtobeclear,a bare metal installation can be a physical machine with nothing running on it,but
it can also a be virtual machine–suchasaVMware,VirtualBox,orKVMinstance–withnothingrunning
on it. Virtual instances may need some additional adjustment to ensure virtualization-related settings
are dealt with correctly. Details on installing BCM onto virtual instances can be found in the BCM
KnowledgeBaseathttp://kb.brightcomputing.com.
To start a physical bare metal installation,the time in the BIOS of the head node is set to local time.
The head node is then made to boot from DVD or USB, which can typically be done by appropriate
keystrokes when the head node boots,or via a BIOS configuration.
Special steps for installation from a bootable USB device: If a bootable USB device is to be used,then
the instructions within the BC MISO,inthefileREADME.BRIGHT USB should be followed to copy the ISO
image over to the USB device. After copying the ISO image, the MD5 checksum should be validated
to verify that the copied ISO is not corrupt. Thisisimportant, because corruption is possible in subtle
ways that may affect operations later on,and in ways that are difficult to uncover.

26 Installing NVIDIA Base Command Manager
3.3.1 ISOBootMenu
If booting from a DVD or USB drive, then a pre-installer menu called the ISO boot menu first loads up
(figure3.1).
Figure3.1: Installation: ISOBootMenu
The ISO Boot menu offers a default option of booting from the hard drive, with a countdown to
starting the hard drive boot. To install BCM, the countdown should be interrupted by selecting the
optionof“Start Base Command Manager Graphical Installer”instead.
Selecting the option allows kernel parameter options to be provided to the installer.
Default kernel parameter options are provided so that the administrator can simply press the enter
key togo straight on to start the installer,and bring up the welcome screen(section3.3.2).
Optional: The net conf Custom Kernel Parameter
Anon-default kernel parameter option is net conf. Setting configuration values for this option config-
ures login and network settings for the cluster manager, and also means that SSH and VNC servers
are launched as the welcome screen(section3.3.2)of the BC M installer starts up. Thisthenallowsthe
cluster administrator to carryout a remote installation,instead of having to remain at the console.
The net conf option can be set for both the GUI and text installer installation.
The net conf custom kernel parameter requires3settings:
1. a setting for the external network interface that is to be used. Forexample: eth0oreth1.
2. a setting for the network configuration of the external network,tobeexplainedsoon.Thenetwork
configuration option can be built either using static IP addressing or with DHCP.
• For static IP addressing,the network configuration format is comma-separated:
static:<IPaddress>,<gatewayaddress>,<netmask>
• ForDHCPaddressing,the format is simply specified using the string dhcp.
3. a setting for the password, for example secretpass, for the login to the cluster manager that is
abouttobeinstalled.
Example
With static IP addressing:
netconf=eth0:static:10.141.161.253,10.141.255.254,255.255.0.0:secretpass
Example
WithDHCPaddressing:
netconf=eth0:dhcp:secretpass
A remote installation can alternatively be carried out later on without setting netconf, by using
the text mode installer to set up networking (section 3.5), or by using GUI mode installer Continue
remotelyoption(figure3.3).

3.3Head Node Installation: BareMetalMethod 27
3.3.2 WelcomeScreen
The welcome screen is shown in figure3.2.
Figure3.2: Installation welcome screen for BC M
An administrator who would like to simply start installation can click on the Start installation
button at the left side of the screen.
3.3.3 SoftwareLicenses
The next screen that is displayed asks the user to read and agree to the NVIDIA Software Licence Agree-
ment(figure3.3):

28 Installing NVIDIA Base Command Manager
Figure3.3: NVIDIA Base Command Manager Software License Agreement
The agreement is carried out by ticking the check box and clicking on the Next button.
Another license agreement screen after that asks the user to agree to the Base Distribution license.
This is the end user license agreement for the distribution(RHEL,Rocky, Ubuntuandsoon)thatisto
be used as the base upon which BC Mis to run.
Options InGUI During The Installation Screens
Asisseeninfigure3.3,the main screens during installation have the following clickable options along
the bottom of the screen:
• Load config: allows an existing configuration file to be loaded and used by the installation. This
option is available only during the first few screens.
• Show config: allows any already loaded configuration file to be displayed. Thereisadefaultcon-
fig u ration loaded by default,with values that may suit the cluster already. However,thedefaults
are not expected to be optimal,and may not even work for the actual physical configuration.
• Continue remotely: allows the administrator to leave the console and access the cluster from a
remotelocation. This can be useful for administrators who,forexample,prefer to avoid working
inside a noisy cold data center. If Continue remotely is selected, then addresses are displayed
on the console screen, for use with a web browser or SSH, and the console installation screen is
locked.
• Back: ifnotgrayedout,the Back option allows the administrator togo back a step in the install a-
tion.

3.3Head Node Installation: BareMetalMethod 29
• Next: allows the administrator to proceed to the next screen.
Console And Log Access During Installation
The cluster administrator can get a root console and view logging by going through the virtual terminals.
For Ubuntu and Rocky the terminals should be allocated as follows:
• Ctrl+Alt+F1: Rootshell
• Ctrl+Alt+F2: Installer(GUI/TUI)
• Ctrl+Alt+F3: Logging(atleastonRocky/RHEL)
• Ctrl+Alt+F5+: Additionalshells
The allocation may change.
3.3.4 Kernel Modules Configuration
TheKernel Modulesscreen(figure3.4)shows the kernel modules recommended for loading based on
ahardwareprobe:
Figure3.4: Kernel Modules Recommended For Loading After Probing
Changes to the modules to be loaded can be entered by reordering the loading order of modules,by
removingmodules,andaddingnewmodules. Clickingthe(cid:13)+ button opens an input box for adding a
module name and optional module parameters(figure3.5). The module can be selected from a built-in;
it can be automatically extracted from a.debor.rpmpackage;or it can simply be selected by selecting
anavailable.ko kernel module file from the filesystem.

30 Installing NVIDIA Base Command Manager
A module can also be blacklisted, which means it is prevented from being used, byclickingonthe
(cid:11)button. This can be useful when replacing one module with another.
Figure3.5: AddingKernelModules
Clicking Next then leads to the“Hardware info”overviewscreen,describednext.
3.3.5 HardwareInfo
TheHardware Infoscreen(figure3.6)provides an overview of detected hardware based on the hard-
ware probe used to load kernel modules. If any hardware is not detected at this stage, then the Back
button can be used togo back to the Kernel Modulesscreen(figure3.4)to add the appropriate modules,
andthentheHardware Information screen can be returned to,to see if the hardware has been detected.

3.3Head Node Installation: BareMetalMethod 31
Figure3.6: Hardware Overview Based On Hardware Detection Used For Loading Kernel Modules
Clicking Next in the Hardware Info screen leads to the Installation source configuration screen,
describednext.
3.3.6 InstallationSource
The installation source screen(figure3.7)detects the available DVD-ROMdevices.

32 Installing NVIDIA Base Command Manager
Figure3.7: DVDSelection
The administrator must select the correct device to continue the installation.
Optionally,a media integrity check can be set.
Clicking on the Next button starts the media integrity check,ifitwasset. The media integrity check
can take about a minute to run. Ifalliswell,thenthe“Cluster settings”setup screen is displayed,as
describednext.
3.3.7 ClusterSettings
TheGeneral cluster settingsscreen(figure3.8)provides an overview of some mandatory and op-
tionalsettings.

3.3Head Node Installation: BareMetalMethod 33
Figure3.8: General cluster settings
Settings that can be provided in this screen are:
• Cluster name
• Administrator email: Where mailto the administrator goes. Thisneednotbelocal.
• Time zone
• Time servers: The defaults are pool.ntp.org servers. A time server is recommended to avoid
problems due to time discrepancies between nodes.
• Nameservers: One or more DNS servers can be set.
• Search domains: One or more domains can be set.
• Environment modules: Traditional T cl modules are set by default. Lmodisanalternative.
3.3.8 Workload Management Configuration
The“Workload manager”configurationscreen(figure3.9)allows a supported workload manager to be
selected. A workload management system is highly recommended to run multiple compute jobs on a
cluster.

34 Installing NVIDIA Base Command Manager
Figure3.9: Workload Management Setup
If no workload manager is selected here,then it can be installed later on,after the cluster installation
without the workload manager has been done. Details on installing a workload manager later on are
giveninChapter7on workload management of the Administrator Manual.
The default clients lot number that is set depends on the workload manager chosen.
• If PBS Professional or Open PBS is selected as a workload management system, thenthenumber
of clients lots defaults to1. After the installation is completed the administrator should update the
value in the pbs pro client role to the desired number of slots for the compute nodes.
• For all other workload management systems, the number of client slots is determined automati-
cally.
The head node can also be selected for running jobs,there by acting as an additional compute node.
This can be a sensible choice on small clusters if the head node can spare such resources.
Clicking Next on this screen leads to the Network topologyscreen.
3.3.9 NetworkTopology
Regular nodes are always located on an internal network,by default called Internal net.
The Network Topology screen allows selection of one of three different network topologies (fig-
ures3.10,3.11,3.12):

3.3Head Node Installation: BareMetalMethod 35
Figure3.10: NetworksTopology: Type1networkselection
Atype1network: has its nodes connected on a private internal network. Thisisthedefaultnet-
work setup. In this topology, a network packet from a head or regular node destined for any
external network that the cluster is attached to,by default called External net,canonlyreachthe
external network by being routed and forwarded at the head node itself. The packet routing for
External net is configured at the head node.
Atype1network is the most common and simple way to run the cluster. Itmeansthatthehead
node provides DHCP and PX E services(duringpre-in it stage node booting only)toasecondary,
isolated network for the worker nodes, segregating the cluster traffic. The external (typically a
corporate)network is then only used to provide access to the head node(s)formanagement.
One limitation is that broader network access must be provided through routing or via a proxy,
should anyone outside of the cluster network need to access anode.

36 Installing NVIDIA Base Command Manager
Figure3.11: NetworksTopology: Type2networkselection
A type 2 network: has its nodes connected via a router to a public network. In this topology,
a network packet from a regular node destined for outside the cluster does not go via the head
node,but uses the router to reach a public network.
Packets between the regular nodes and the head node however still normally go directly to each
other, including the DHCP/PXE-related packets during pre-init stage node booting, since in a
normal configuration the regular nodes and head node are on the same network.
Any routing for beyond the router is configured on the router,and not on the cluster or its parts.
Care should be taken to avoid conflicts between the DHCP server on the head node and any
existing DHCP server on the internal network, if the cluster is being placed within an existing
corporate network that is also part of Internalnet (there is no Externalnet in this topology).
Typically,in the case where the cluster becomes part of an existing network,there is another router
configured and placed between the regular corporate machines and the cluster nodes to shield
them from effects on each other.
Atype2network does not isolate the worker nodes from the network above it. Instead,eachnode
remains reachable through the main data plane. This is useful for clusters hosting services, such
asawebportal,avoiding the use of proxies.

3.3Head Node Installation: BareMetalMethod 37
Figure3.12: NetworksTopology: Type3networkselection
Atype3network: has its nodes connected on a routed public network. Inthistopology,anetwork
packet from a regular node,destined for another network,uses a router to get to it.Theheadnode,
being on another network,can only be reached via a router too.The network the regular nodes are
on is called Internal net by default,and the network the head node is on is called Management net
bydefault. Any routing configuration for beyond the routers that are attached to the Internal net
and Management net networks is configured on the routers,and not on the clusters or its parts.
A consequence of using a router in the type 3 configuration is that the communication between
the head node and the regular nodes is via OSI layer 3. So, OSI layer 2 used by DHCP is not
directly supported. However, DHCP/PXE packets still need to be exchanged between the head
and regular nodes during pre-initnodeboot. The usual way to relay the packets is using a DHCP
relayagent. Configuration of a DHCP relay agent is outside the scope of BC M configuration,and
is typically done by the network administrator or the router vendor.
For a type 2 network, a DHCP relay agent may also be needed if the regular nodes are spread
across several subnet s.
Selecting the network topology helps decide the predefined networks on the Networks settings
screenlater(figure3.16). Clicking Next here leads to the Head node settingsscreen,describednext.
3.3.10 HeadNodeSettings
The head node settings screen(figure3.13)canbeusedtoset,fortheheadnode:
• thehostname

38 Installing NVIDIA Base Command Manager
• thepassword
• the hardware manufacturer
Figure3.13: Headnodesettings
Clicking Next leads to the Compute node settingsscreen,describednext.
3.3.11 Compute Nodes Settings
The compute nodes settings screen(figure3.14)canbeusedtoset,forthecomputenodes:
• the number of racks used to host the nodes
• thenumberofnodes
• the naming format for the nodes. Thisconsistsof:
– thenodebasename(default: node)
– thenodestartnumber(default: 1)
– thenodedigits(default: 3)
By default therefore, the first compute node takes the name node001, the second compute node
takesthenamenode002,andsoon.
• the hardware manufacturer

| 3.3Head Node Installation: | BareMetalMethod | 39  |
| ------------------------ | --------------- | --- |
Figure3.14: Computenodesettings
| Clicking Next leads to the BMC | configurationscreen,describednext. |     |
| ------------------------- | ---------------------------------- | --- |
3.3.12 BMCConfiguration
The BMC (Baseboard Management Controller) screen (figure 3.15) configures BMCs compatible with
IPMI,iDRAC,iLO,orCIMC.
The BMC s can be configured for the head or compute nodes.

40 Installing NVIDIA Base Command Manager
Figure3.15: BMCconfiguration
If the administrator confirms that the nodes are to use BMC s(Baseboard Management Controllers)
that are compatible with IP MI,iLO,CIMC,iDRAC,orRedfish,then the BMC network options appear.
Bydefault,forthecomputenodes,the BMC is automatically configured.
For a Type 1 network, the head node BMC is often connected to an ethernet segment that has the
external network running on it, while the BMCs on the compute nodes are normally connected to an
ethernet segment that has the internal network on it.
Once a network associated with the ethernet segment is chosen, it means that further BMC-related
networking values can be set for the BMC s.
AnewLayer3IP subnet can be created for BMC interfaces.
The BMC interface can be configured as a shared physical interface with an already existing network
interface.However this can in some cases cause problems during early system BIOS checks.Adedicated
physical BMC interface is therefore recommended.
IfaBMCisconfigured,then the BMC password is set to a random value. Retrieving and changing a
BMC password is covered in section3.7.2of the Administrator Manual. BMC configuration is discussed
furtherinsection3.7of the Administrator Manual.
Clicking Next leads to the Networks screen,describednext.
3.3.13 Networks
The Networks configuration screen (figure 3.16) displays the predefined list of networks, based on the
selection of network topology and BMC networks made in the earlier screens.

3.3Head Node Installation: BareMetalMethod 41
Figure3.16: Networks configuration,internalnettab
The Networks configuration screen allows the parameters of the network interfaces to be configured
via tabs for each network. In addition to any BMC networks:
Foratype1setup,an external network and an internal network are always defined.
Foratype2setup,an internal network is defined but no external network is defined.
Foratype3setup,an internal network and a management network are defined.
Thus,foratype1network,forexample,the networking details:
• for external net correspond to the details of the head node external network interface.
• for internal net correspond to the details of how the compute nodes are configured.
• for a BMC network correspond to the details of how the BMC is connected
Additional custom networks can be added in the Networks configuration screen by clicking on the
(cid:13)+ button.
Clicking Next in this screen validates all network settings. Invalid settings for any of the defined
networks cause an alert to be displayed, explaining the error. A correction is then needed to proceed
further. Settings may of course be valid,butincorrect—the validation is merely a sanity check. Itmay
be wise for the cluster administrator to check with the network specialist that the networks that have
been configured are setup as really intended.
If all settings are valid,then the Next button brings the installation on to the Head node interfaces
screen,describednext.

42 Installing NVIDIA Base Command Manager
3.3.14 Headnodeinterfaces
The Head node interfaces screen (figure 3.17) allows a review of the head node network interfaces
and their proposed settings.
Figure3.17: Head node interfaces configuration
If a BMC network is to be shared with a regular network, then an alias interface is shown too. In
figure3.17analiasinterface,ens3:ipmi,isshown.
Interfaces can be created or removed.
Drop down selection allows the proposed values to be changed. It is possible to swap network inter-
faces with drop down selection.
Clicking the Next button brings the installation on to the Compute node interfaces screen, de-
scribednext.
3.3.15 Compute node interfaces
TheCompute node interfacesscreen(figure3.18)allows a review of the compute node network inter-
faces and their proposed settings.

3.3Head Node Installation: BareMetalMethod 43
Figure3.18: Compute node interfaces configuration
The boot interface BOOT IF is used to pickup the image for the no devi anode provisioning.
The IP offset is used to calculate the IP address assigned to a regular node interface. Thenodesare
conveniently numbered in a sequence,so their interfaces are typically also given a network IP address
that is in a sequence on a selected network. In BCM, interfaces by default have their IP addresses
assigned to them sequentially,instepsof1,starting after the network base address.
The default IP offset is 0.0.0.0, which means that the node interfaces by default start their range at
the usual default values in their network.
With a modified IP offset, the point at which addressing starts is altered. For example, a different
offset might be desirable when no IP MI network has been defined,but the nodes of the cluster do have
IP MI interfaces in addition to the regular network interfaces. If a modified IP offset is not set for one of
theinterfaces,then the BOOT IF and ip mi0interfaces get IP addresses assigned on the same network by
default,which could be confusing.
However, if an offset is entered for the ipmi0 interface, then the assigned IPMI IP addresses start
from the IP address specified by the offset. Thatis,each modified IP MI address takes the value:
address that would be assigned by default+IPoffset
Example
Taking the case where BOOT IF and IP MI interfaces would have IP addresses on the same network with
thedefaultIPoffset:
Then,onaclusterof10nodes,a modified IP MI IP offset of0.0.0.20means:
• the BOOT IF interfaces stay on10.141.0.1,...,10.141.0.10while

44 Installing NVIDIA Base Command Manager
• the IP MI interfaces range from10.141.0.21,...,10.141.0.30
Clicking the Next button brings the installation on to the Disk layoutscreen,describednext.
3.3.16 DiskLayout
IntheDisk layout configuration screen(figure3.19)the administrator must select the drive on the head
node where the BC M software is to be installed.
Figure3.19: Disklayoutscreen
3.3.17 DiskLayoutSettings
The next screen is the Disk layout settings configuration screen(figure3.20).

3.3Head Node Installation: BareMetalMethod 45
Figure3.20: Disk layout settings screen
It is used to set the partitioning layouts. The partitioning layout XML schema is described in detail
in Appendix D of the Administrator Manual.
The administrator must set the disk partitioning layout for the head node and regular nodes with
thetwooptions: Head node disk layoutandCompute nodes disk layout.
• – The head node by default uses
* one big partition if it has a drive size smaller than about500GB
* several partitions if it has a drive size greater than or equal to about500GB.
– The compute node by default uses several partitions,usingtheDefault Standard Layout.
A partitioning layout other than the default can be selected for installation from the drop-down
options for the head node and regular nodes.Possible partitioning options include RAID,failover,
STIG-compliant,andLUKSschemes.
• The icon can be clicked to allow a custom partitioning layout specification to be added:
– asafile
– from the default template,for use as a starting point for a specification
• Partitioning layouts can be edited with the icon. This brings up a screen (figure 3.21) that
allows the administrator to view and change layout values within the layout’sconfigurationXML
file:

46 Installing NVIDIA Base Command Manager
Figure3.21: Edit Disk Partitioning
The XML schema is described in Appendix D.1of the Administrator Manual.
• The head node partitioning layout is the only installation setting that cannot easily be changed
afterthecompletion(section3.3.20)ofinstallation. It should therefore be decided upon with care.
• Bydefault,BC M mounts filesystems on the head node with A CLs set and extended attributes set.
• The XML schema allows the definition of a great variety of layouts in the layout’s configuration
XMLfile:
Example
1. for a large cluster or for a cluster that is generating a lot of monitoring or burn data, the
default partition layout partition size for /var may fill up with log messages because log
messages are usually stored under /var/log/. If /var is in a partition of its own, as in the
default head node partitioning layout presented when the hard drive is about500GBormore,
then providing a larger size of partition than the default for/var allows more logging to take
placebefore/varisfull. Modifying the value found within the<size></size>tagsassociated
with that partition in the XML file modifies the size of the partition that is to be installed.This
can be conveniently done from the frontend shown in figure3.21.
2. the administrator could specify the layout for multiple non-RAID drives on the head node
usingone<blockdev></blockdev>tag pair within an enclosing<device></device>tagpairfor
eachdrive.
3. Fornon-bootpartitions,it is possible to setup LUK S encrypted disk partitions on head and
regularnodes. Scrolling through the Partition Properties column of figure3.21,andtick-
ing the Enable encryption checkbox, makes the LUKS configuration parameters available
(figure3.22):

3.3Head Node Installation: BareMetalMethod 47
Figure3.22: Disk Encryption Configuration
The parameters can be left at their default values to setup an encrypted partition.
If setting parameters, then there are some existing fields to set the more common parame-
ters. Settings for less-common parameters that have no existing fields can be specified and
appended to the field with the Additional Parameters: setting.
The settings are automatically stored in the XML specification for the disk layout and can be
viewed there by selecting the XML Outputtab.
How a cluster administrator applies this configured disk encryption to anode that is booting
up is covered in Appendix D.17of the Administrator Manual.
Clicking Next on the Disk layout screen leads to the Additional softwarescreen,describednext.
3.3.18 AdditionalSoftware
TheAdditional softwarescreen(figure3.23)displays software that can be added to the cluster if it was
provided with the installer. The software is only provided to the installer if selected when generating
theinstallerISO.CUDA is a possible additional software.
If NVIDIA A I Enterprise is to be used,then these options must not be selected.

48 Installing NVIDIA Base Command Manager
Figure3.23: Additional software screen
Clicking Next on the Additional software screen leads to the Summary screen,describednext.
3.3.19 Summary
The Summary screen (figure 3.24), summarizes some of the installation settings and parameters config-
u red during the previous stages.

3.3Head Node Installation: BareMetalMethod 49
Figure3.24: Summary of Installation Settings
Going back to correct values is still possible at this stage.
Clicking on the Next button leads to the“Deployment”screen,describednext.
3.3.20 Deployment
TheDeploymentscreen(figure3.25)shows the progress of the deployment. It is not possible to navigate
back to previous screens once the installation has begun. The installation log can be viewed in detail by
clickingonInstall log.
The Reboot button restarts the machine. Alternatively, the head node can be set to automatically
reboot when deployment is complete.
Duringthereboot,the BIOS boot order may need changing,or the DVD may need to be removed,in
order to boot from the hard drive on which BC M has been installed.

50 Installing NVIDIA Base Command Manager
Figure3.25: Deploymentcompleted
Afterrebooting,the system starts and presents a login prompt. The cluster administrator can login
as root using the password that was set during the installation procedure.
The cluster should then be updated with the latest packages(Chapter9of the Administrator Manual).
After the latest updates have been installed,the system is ready to be configured.
3.3.21 Licensing And Further Configuration
The administrator with no interest in the add-on method of installation can skip on to installing the
license (Chapter 4). After that, the administrator can look through the Administrator Manual, where
toolsand conceptsusedwith BCMareintroduced, so thatfurthercluster configurationcanbe carried
out.
3.4 Head Node Installation: Ansible Add-On Method
An add-on installation, in contrast to the bare metal installation (section 3.3), is an installation that is
done onto a machine that is already running one of the supported distributions of section 2.1. The
installation of the distribution can therefore be skipped for this case. Theadd-onisnotrecommended
for inexperienced cluster administrators. This is because of the following reasons:
• The installation configuration may conflict with what has already been installed. The problems
that arise can always be resolved, but an administrator that is not familiar with BCM should be
prepared for troubleshooting.
• Additional repositories typically need to be added

3.4Head Node Installation: AnsibleAdd-OnMethod 51
• Dependency and deprecated issues may need workaround s.
• Resolving an issue due to a custom configuration in the OS distribution image is outside the scope
ofstandardsupport.
Using the head node installer An sib le collection is the recommended method for carrying out add-on
installations.
Aside: An sib le can also be used with BC M once NVIDIA Base Command Manager is installed. This
integration is described in section14.10of the Administrator Manual.
3.4.1 AnOverviewOfAnsible
An sib le is a popular automated configuration management software.
The BCM administrator is expected to have some experience already with Ansible. The basic con-
ce pts are covered in the official An sib le documentation at https://docs.ansible.com/ansible/latest/
user_guide/basic_concepts.html,and further details are accessible from that site too.
Asareminder:
• An sib le is designed to administer groups of machines from an inventory of machines.
• An Ansible module is code, usually in Python, that is executed by Ansible to carry out Ansible
tasks,usually on a remote node. The module returns values.
• An Ansible playbook is a YAML file. The file declares a configuration that is to be executed (“the
playbook is followed”) on selected machines. The execution is usually carried out over SSH, by
placing modules on the remote machine.
• Traditionally, official An sib le content was obtained as apart of milestone releases of An sib leE n-
gine,(the Red Hat version of An sib le for the enterprise).
• SinceAnsibleversion2.10,the official way to distribute content is via An sib le content collections.
Collections are composed of An sib le play books, modules, module utilities and plugins. Thecol-
lect ionis a formatted set of tools used to achieve automation with An sib le.
• The official Ansible list of collections is at https://docs.ansible.com/ansible/latest/
collections/index.html#list-of-collections. At the time of writing of this section (March
2022)therewere100collections.
• Community-supported collections are also available,atgalaxy.ansible.com.
3.4.2 TheHeadNodeAdd-on Installer And An sib le
The head node installer is shipped as anAnsi ble collection. If the correct parameters are defined in the
user’s playbooks and roles, then the collection defines brightcomputing.installer.head_node. The
brightcomputing.installer.head_node deploys the BC M head node on to the supported distribution,
The head node installation also includes deployment of the default software image and node-
installer image components, which is required for provisioning compute nodes. Using the head node
installer collection requires practical knowledge of An sib le and BC M.Add-on deployment is supported
onbothbare-metalandpubliccloud(AWSandAzure).
Locations For The Head Node Add-onInstaller
• https://galaxy.ansible.com/ui/repo/published/brightcomputing/installer110/istheof-
fic i alAns i ble Galaxy location for detailed documentation about the head node installer collection
anditsusage.
• https://github.com/Bright-Computing/bright-installer-ansible/tree/main/playbooks
contains additional documentation and example play books.

52 Installing NVIDIA Base Command Manager
3.5 Enabling Remote Browser-Based Installation Via The Text Mode Installer
When carrying out an installation as in section3.3,the installer is normally run on the machine that is to
be the head node of the cluster. A text mode installer is presented as an alternative to the GUI installer
(figure3.1).
The text mode installer is a very minimal installer compared with the GUI installer. TheGUIinstal-
lat ionis therefore usually preferred.
However, in some cases the GUI installation can fail to start. Forexample, ifXisnotworkingcor-
rect ly for some reason on the head node.
Away to still run a GUI installation is then to first run the text mode installer,anduseittorunthe
Remote Install option from its main menu(figure3.26):
Figure3.26: ncurses Remote Installation Option
This then sets up network connectivity, and provides the cluster administrator with a remote URL
(figure3.27):
Figure3.27: ncurses Remote Installation Remote URL Displayed
A browser that is on a machine with connectivity to the head node can then use the provided remote
URL.This then brings up the GUI installer within the browser.
An alternative to running the text mode installer to obtain the remote URL is to use the netconf
kernel parameter instead. Details on configuring this are given in section3.3.1.

4
Licensing NVIDIA Base
Command Manager
This chapter explain show an NVIDIA Base Command Manager license is viewed,verified,requested,
andinstalled. The use of a product key to activate the license is also explained.
Typically,for a new cluster that is purchased from are seller,the cluster has BC M already setup on
it.
• BCM can be run with a temporary, or evaluation license, which allows the administrator to try it
out. This typically has some restrictions on the period of validity for the license,orthenumberof
nodes or GPUs in the cluster.
– The default evaluation license comes with the online ISO download. The ISO is available
for product key owners via http://customer.brightcomputing.com/Download. Thelicense
that is shipped with the ISO allows up to two nodes to be used.It can be used for ahead node
and up to one compute node,or it can be used with two head nodes. Clustersthatrunwith
this license do not qualify for support beyond the basic installation of Chapter 3. The idea
behind this license is that the installed BC M software then allows installation of an evaluation
license with greater privileges,or another full license.
– A custom evaluation license can be set up by the NVIDIA sales team and configured for
anagreed-upon number of GPUs and an agreed-uponvalidityperiod, typicallyfrom1to3
months.
• In contrast to an evaluation license, there is the full license. A full license is almost always a sub-
scription license. Installing a full license allows BCM to function without the restrictions of an
evaluationlicense. The administrator therefore usually requests a full license,andinstallsit. This
normally only requires the administrator to:
– Have the product key at hand
– Runtherequest-license script on the head node
The preceding takes care of the licensing needs for most administrators,and the rest of this chapter
can then usually conveniently be skipped.
Administrators who would like a better background understanding on how licensing is installed
and used in BC M can goon to read the rest of this chapter.
CM Daemon can run only with a nun expired evaluation or un expired full license. CMDaemonisthe
engine that runs BCM, and is what is normally recommended for further configuration of the cluster.
BasicCMDaemon-based cluster configuration is covered in Chapter3of the Administrator Manual.
Any BC M installation requires a license file to be present on the head node. The license file details the
attributes under which a particular BC M installation has been licensed.

54 Licensing NVIDIA Base Command Manager
Example
• The“Licensee”details,which include the name of the organization,is an attribute of the license
file that specifies the condition that only the specified organization may use the software.
• The “Licensed tokens” attribute specifies the maximum number of GPUs that the cluster man-
agermaymanage. This is also the maximum number of nodes that the license covers. Headnodes
are also regarded as nodes for this attribute.
• The“Expiration date”of the license is an attribute that sets when the license expires. Itissome-
times set to a date in the near future so that the cluster owner effectively has a trial period. A
new license with a longer period can be requested(section4.3)after the owner decides to continue
using the cluster with BC M.
A license file can only be used on the machine for which it has been generated and cannot be changed
onceithasbeenissued.This means that to change licensing conditions,a new license file must be issued.
The license file is sometimes referred to as the cluster certificate, or head node certificate, because it is
theX509v3certificate of the head node,and is used throughout cluster operations. Itscomponentsare
locatedunder/cm/local/apps/cmd/etc/.Section2.3of the Administrator Manual has more information
oncertificate-basedauthentication.
4.1 Displaying License Attributes
Before starting the configuration of a cluster,it is important to verify that the attributes included in the
license file have been assigned the correct values. The license file is installed in the following location:
/cm/local/apps/cmd/etc/cluster.pem
and the associated private key file is in:
/cm/local/apps/cmd/etc/cluster.key
4.1.1 Displaying License Attributes Within Base View
Base View is typically accessed using a“home”URLintheformof:
https://<headnodeaddress>:8081/base-view/
To verify that the attributes ofthe license have been assigned the correct values, the license details
can be displayed with the navigation path Cluster>License Information(figure4.1).

4.2VerifyingALicense—Theverify-licenseUtility 55
Figure4.1: Licenseinformation
4.1.2 Displaying License Attributes Within cm sh
Alternatively the license infocomm and within the main mode of cm sh maybe used:
Example
| [root@basecm11 | ~]# cmsh         |     |     |
| -------------- | ---------------- | --- | --- |
| [basecm11]%    | main licenseinfo |     |     |
License Information
------------------------------------ ------------------------------------------------------
Licensee /C=US/ST=California/L=San Jose/O=NVIDIA Corporation...
| Serial       | number       | 2913820                             |                  |
| ------------ | ------------ | ----------------------------------- | ---------------- |
| Start time   |              | Sat Feb                             | 8 16:00:00 2025  |
| End time     |              | Sun May                             | 25 16:59:00 2025 |
| Version      |              | 10 and                              | above            |
| Edition      |              | NVIDIA                              | Mission Control  |
| Type         |              | Free                                |                  |
| Licensed     | nodes        | 56 / 8192                           |                  |
| Licensed     | accelerators | 144 / 8192                          |                  |
| Accelerators | details      | 36 * 4                              | gpu              |
| Allow edge   | sites        | Yes                                 |                  |
| MAC address  | / Cloud ID   | C2:5F:B9:48:A2:3C|7C:C2:A8:6B:9B:EA |                  |
[basecm11]%
The license shown in the preceding example allows8192nodesand8192GPUstobeused.
The license is tied to a specific MAC address, or to 2 specific MAC addresses in the case of high-
availability, so that it cannot simply be used elsewhere. Forconvenience, theUsed tokensfieldinthe
output of license info shows the current number of nodes used.
| 4.2 Verifying | A License—The | verify-license | Utility |
| ------------- | ------------- | -------------- | ------- |

56 Licensing NVIDIA Base Command Manager
4.2.1 Theverify-license Utility Can Be Used When license info Cannot Be Used
Unlike the licenseinfo command in cmsh (section 4.1), the cluster administrator can run the
verify-license utility to check license seven if the cluster management daemon is not running.
When an invalid license is used,the cluster management daemon cannot start. Thelicenseproblem
is logged in the cluster management daemon log file:
Example
| [root@basecm11 | ~]#               | service cmd               | start   |                     |
| -------------- | ----------------- | ------------------------- | ------- | ------------------- |
| Waiting        | for CMDaemon      | to start...               |         |                     |
| CMDaemon       | failed to         | start please              | see log | file.               |
| [root@basecm11 | ~]#               | tail -1 /var/log/cmdaemon |         |                     |
| Dec 30         | 15:57:02 basecm11 | CMDaemon:                 | Fatal:  | License has expired |
but further information cannot be obtained using Base View or cm sh, because these clients themselves
obtain their information from the cluster management daemon.
Insuchacase,theverify-license utility allows the troubleshooting of license issues.
4.2.2 UsingTheverify-license Utility To Troubleshoot License Issues
There are four ways in which the verify-license utility can be used:
| 1. Usingverify-license with no options: |     |     |     | simply display sausage text: |
| ------------------------------------ | --- | --- | --- | ------------------------- |
Example
| [root@basecm11 | ~]# | verify-license |     |     |
| -------------- | --- | -------------- | --- | --- |
Usage: verify-license <path to certificate> <path to keyfile> <verify|info|monthsleft[=12]>
verify-license <verify|info|monthsleft[=12]> (uses /cm/local/apps/cmd/etc/cluster.pem,key)
| 2. Usingverify-license with the info option: |     |     |     | prints license details: |
| ---------------------------------------- | --- | --- | --- | --------------------- |
Example
| [root@basecm11 | ~]#          | verify-license | info              |         |
| -------------- | ------------ | -------------- | ----------------- | ------- |
| =========      | Certificate  | Information    | ========          |         |
| Version:       |              |                | 10                |         |
| Edition:       |              |                | NVIDIA Mission    | Control |
| OEM:           |              |                | NVIDIA            |         |
| Common         | name:        |                | basecm11          |         |
| Organization:  |              |                | My organization   |         |
| Organizational | unit:        |                | None              |         |
| Locality:      |              |                | None              |         |
| State:         |              |                | None              |         |
| Country:       |              |                | US                |         |
| Serial:        |              |                | 3174979           |         |
| Starting       | date:        |                | 09/Feb/2025       |         |
| Expiration     | date:        |                | 25/Sep/2025       |         |
| MAC address    | / Cloud      | ID:            | FA:16:3E:73:6E:5E |         |
| Licensed       | tokens:      |                | 8192              |         |
| Accounting     | & Reporting: |                | Yes               |         |
| Allow edge     | sites:       |                | Yes               |         |
| License        | type:        |                | Free              |         |
==========================================

4.2VerifyingALicense—Theverify-licenseUtility 57
3. Usingverify-license with the verify option: checks the validity of the license:
• Ifthelicenseisvalid,then no output is produced and the utility exits with exit code0.
• If the license is invalid,then output is produced indicating what is wrong. Messagessuchasthese
arethendisplayed:
|     | – Ifthelicenseisold: |     |     |
| --- | -------------------- | --- | --- |
Example
|     | [root@basecm11                              | ~]# verify-license | verify |
| --- | ------------------------------------------- | ------------------ | ------ |
|     | License has                                 | expired            |        |
|     | License verification                        | failed.            |        |
|     | – If the certificate is not from Bright Computing: |                    |        |
Example
|     | [root@basecm11 | ~]# verify-license | verify |
| --- | -------------- | ------------------ | ------ |
Invalid license: This certificate was not signed by a correct signing authority
|     | License verification | failed. |     |
| --- | -------------------- | ------- | --- |
4. Usingverify-license with the months left[=<value>]option:
• If a number value is set for months left,then
– if the license is due to expire in more than that number of months,thentheverify-license
command returns nothing.
– if the license is due to expire in less than that number of months, then the verify-license
command returns the date of expiry
• If a number value is not set for months left,thenthevalueissetto12bydefault. Inotherwords,
the default value means that if the license is due to expire in less than12months,thenthedateof
expiry of the license is displayed.
Alicense,withjustover3monthsvalidityleft,is examined in the following example:
Example
| [root@basecm11 | etc]#       | date           |              |
| -------------- | ----------- | -------------- | ------------ |
| Tue Jun        | 24 12:49:41 | PM CEST 2025   |              |
| [root@basecm11 | etc]#       | verify-license | monthsleft=3 |
| [root@basecm11 | etc]#       | verify-license | monthsleft=4 |
Cluster Manager license expiration date: 25/Sep/2025, time remaining: 13w 1d
| [root@basecm11 | etc]# | verify-license | monthsleft |
| -------------- | ----- | -------------- | ---------- |
Cluster Manager license expiration date: 25/Sep/2025, time remaining: 13w 1d
4.2.3 Using The version infoComm and To Verify The BC M Software Version
The license version should not be confused with the BCM software version. The license version is a
license format version that rarely changes between cluster manager version releases. Thusaclustercan
havealicenseversion10.0,which was the license format introduced during BC M10.0,andBCMcanbe
atsoftwareversion11.0.
The software version of a cluster can be viewed using the version infocomm and,whichcanberun
from the main mode of cms has follows:
Example

| 58                |             |                | Licensing NVIDIA Base Command Manager |     |
| ----------------- | ----------- | -------------- | --------------------------------- | --- |
| [root@basecm11    | ~]# cmsh    |                |                                   |     |
| [basecm11]% main  |             |                |                                   |     |
| [basecm11->main]% | licenseinfo | | grep Version |                                   |     |
| Version           |             | 10 and above   |                                   |     |
| [basecm11->main]% | versioninfo |                |                                   |     |
versioninfo
Version Information
------------------------ ----------------------------------------------------
| Cluster Manager  | 11.0            |     |     |     |
| ---------------- | --------------- | --- | --- | --- |
| CMDaemon         | 3.1             |     |     |     |
| CMDaemon Build   | Index 163199    |     |     |     |
| CMDaemon Build   | Hash 70ba1c343e |     |     |     |
| Database Version | 36375           |     |     |     |
In the preceding example,the version of the cluster manager is11.0,while the license is for BC M10
andabove.
| 4.3 Requesting | And | Installing A License | Using A Product | Key |
| -------------- | --- | -------------------- | --------------- | --- |
The license file is introduced at the start of this chapter(Chapter4).Asstatedthere,mostadministrators
that have installed a new cluster,and who need to install a license on the cluster in order to make their
BCMfullyfunctional,only need to do the following:
• Have their product key at hand
• Runtheinstall-license script on the head node
The details of this section are therefore usually only of interest if a more explicit understanding of
the process is required for some reason.
4.3.1 IsALicenseNeeded?—Verifying License Attributes
Before installing a license,the license attributes should be verified(section4.2)to check if installation is
actuallyneeded. If the attributes of the license are correct,the remaining parts of this section(4.3)may
safelybeskipped. Otherwise the product key(page58)is used to install a license.
Incorrect license attributes will cause cluster configuration to fail or may lead to a misconfigured
cluster. A misconfigured cluster may, for example, not have the ability to handle the full number of
GPUsornodes. Inparticular, the license date should be checked to make sure that the license has not
expired. If the license is invalid, and it should be valid according to the administrator, then the BCM
reseller that provided the software should be contacted with details to correct matters.
If BC Mis already running with a regular license,and if the license is due to expire,thenreminders
are sent to the administrator e-mailaddress(page94of the Administrator Manual).
4.3.2 TheProductKey
A product key is issued by an account manager for BC M.The product key allows a license to be obtained
torunBCM.
An account manager is the person from BCM who checks that the product key user has the right
entitlements to use the key before it is issued. The customer is informed who the account manager
is when BCM is purchased. Purchasing and licensing period queries are normally dealt with by the
accountmanager,while other technical queries that cannot be answered by existing documentation can
be dealt with by BC M technical support(section14.2of the Administrator Manual).
The following product key types are possible:
• Evaluation product key: An evaluation license is a temporary license that can be installed via an
evaluation product key. The evaluation product key is valid for amaximumof3monthsfrom a
specifieddate,unless the account manager approves a further extension.

4.3Requesting And Installing A License Using A Product Key 59
If a cluster has BC M installed on it,then a temporary license to run the cluster can be installed with
an evaluation product key. Such a key allows to the cluster to run with defined attributes, such
as a certain number of nodes and features enabled,depending on what was agreed upon with the
accountmanager. The temporary license is valid until the product key expires,unlesstheaccount
manager has approved further extension of the product key,and the license has been re-installed.
Evaluation ISO downloads of BC M from the BC M website come with a built-inlicensethatover-
rides any product key attributes. The license is temporary. An evaluation ISO product key allows
the user to download the ISO with a temporary built-in license. The temporary built-in license
thenallows2-node clusters to be tried out. Such a cluster can comprise1headnodeand1com-
putenode,oritcancomprise2headnodes. A2-node cluster is a very limited cluster,andsupport
for this is given accordingly.
• Subscription product key:A subscription license is a license that can be installed with a sub scrip-
tion product key. The subscription product key has some attributes that decide the subscription
length and other settings for the license. The length can be set to any value.
If a cluster has BC M installed on it,then a subscription license to run the cluster can be installed
with a subscription product key. Such a key allows the cluster to run with defined attributes,such
as a certain number of nodes and features enabled,depending on what was agreed upon with the
accountmanager. The subscription license is valid until the subscription product key expires.
• Hardware lifetime product key: This is a legacy product key that is supported for the hardware
lifetime. Itisnolongerissued.
The product key looks like: the following pattern of digits:
000354-515786-112224-207441-186713
If the product key has been used on the cluster already: then it can be retrieved from the CSR file
(page60)withthecommand:
cm-get-product-key
The product key allows: the administrator to obtain and activate a license, which allows the cluster
managertofunction.
The following terminology is used: when talking about product keys,locking,licenses,installation,
andregistration:
• activatingalicense: A product key is obtained from any BC M(re)seller. Itisusedtoobtainand
activate a license file. Activation means that NVIDIA records that the product key has been used
to obtain a license file. The license obtained byproduct key activation permits the cluster to work
with particular settings. For example, the subscription period, and the number of nodes. The
subscription start and enddate cannot be altered for the license file associated with the key,soan
administrator normally activates the license file as soon as possible after the starting date in order
to not waste the subscription period.
• lockingaproductkey: The administrator is normally allowed to use a product key to activate a
licenseonlyonce.This is because a product key is locked on activation of the license.Alockedstate
means that product key cannot activate a new license—itis“usedup”.
An activated license only works on the hardware that the product key was used with. Thiscould
obviously be a problem if the administrator wants to move BC M to new hardware. Insuchacase,

60 Licensing NVIDIA Base Command Manager
the product key must be unlocked. Unlocking is possible for a subscription license via https:
//customer.brightcomputing.com/unlock.
Unlocking an evaluation license,or a hardware lifetime license,is possible by sending a request to
the account manager at NVIDIA to unlock the product key.
Once the product key is unlocked,then it can be used once again to activate a new license.
• license installation: License installation occurs on the cluster after the license is activated and is-
sued. The installation is done automatically if possible. Sometimes installation needs to be done
manually, as explained in the section on the request-license script (page 60). The license can
only work on the hardware it was specified for. After installation is complete, the cluster runs
with the activated license.
4.3.3 Requesting A License With The request-licenseScript
If the license has expired,or if the license attributes are otherwise not correct,a new license file must be
requested.
The request for a new license file is made using a product key(page58)withtherequest-license
command.
The request-license command is used to request and activate a license, and works most conve-
niently with a cluster that is able to access the internet. The request can also be made regardless of
cluster connectivity to outside networks.
There are three options to use the product key to get the license:
1. DirectWWWaccess: If the cluster has access to the WWW port,then a successful completion of
therequest-license command obtains and activates the license. It also locks the product key.
• Proxy WWW access: If the cluster uses a web-proxy, then the environment variable
http_proxy must be set before the request-licensecommandisrun. Fromabashprompt
thisissetwith:
export http_proxy=<proxy>
where<proxy>is the hostname or IP address of the proxy. An equivalent alternative is that
the Script Environment directive(page905of the Administrator Manual),whichisaCMDae-
mondirective,can be set and activated(page885of the Administrator Manual).
2. Off-cluster WWW access: If the cluster does not have access to the WWW port,
but the administrator does have off-cluster web-browser access, then the point at
which the request-license command prompts “Submit certificate request to
http://licensing.brightcomputing.com/licensing/index.cgi ?” should be answered
negatively. CSR (Certificate Sign Request) data generated is then conveniently displayed
on the screen as well as saved in the file /cm/local/apps/cmd/etc/cluster.csr.new. The
cluster.csr.new file maybe taken off-cluster and processed with an off-clusterbrowser.
The CSR file should not be confused with the private key file, cluster.key.new, created shortly
beforehand by the request-licensecommand. In order to maintain cluster security,theprivate
keyfilemust,inprinciple,never leave the cluster.
At the off-cluster web-browser, the administrator may enter the cluster.csr.new content in a
webformat:
http://licensing.brightcomputing.com/licensing
A signed license text is returned. At NVIDIA the license is noted as having been activated, and
the product key is locked.
The signed license text received by the administrator is in the form of a plain text certificate. As
the web form response explains,it can be saved directly from most browsers. Cuttingandpasting

4.3Requesting And Installing A License Using A Product Key 61
the text into an editor and then saving it is possible too,since the response is plaintext. Thesaved
signed license file, <signedlicense>, should then be put on the head node. If there is a copy of
thefileontheoff-clustermachine,the administrator should consider wiping that copy in order to
reduce information leakage.
Thecommand:
| install-license |     |     | <signedlicense> |     |     |
| --------------- | --- | --- | --------------- | --- | --- |
installs the signed license on the head node, and is described further on page 61. Installation
means the cluster now runs with the activated certificate.
3. Fax or physical delivery: If no internet access is available at all to the administrator,theCSRdata
maybe faxed or sent as a physical delivery(postalmailprintout,USBflashdrive/floppydisk)to
anyBCMreseller. A certificate will be faxed or sent back in response,the license will be noted by
NVIDIA as having been activated,and the associated product key will be noted as being locked.
The certificate can then be handled further as described in option2.
Example
| [root@basecm11 |                                           | ~]# request-license |     |     |     |
| -------------- | ----------------------------------------- | ------------------- | --- | --- | --- |
| Product        | Key (XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX): |                     |     |     |     |
000354-515786-112224-207440-186713
| Country        | Name (2  | letter   | code):     | US                                     |             |
| -------------- | -------- | -------- | ---------- | -------------------------------------- | ----------- |
| State or       | Province | Name     | (full      | name):                                 | California  |
| Locality       | Name     | (e.g.    | city):     | San Jose                               |             |
| Organization   | Name     | (e.g.    | company):  | ACME                                   | Inc.        |
| Organizational |          | Unit     | Name (e.g. | department):                           | Development |
| Cluster        | Name:    | basecm11 |            |                                        |             |
| Private        | key data | saved    | to         | /cm/local/apps/cmd/etc/cluster.key.new |             |
MAC Address of primary head node (basecm11) for eth0 [00:0C:29:87:B8:B3]:
Will this cluster use a high-availability setup with 2 head nodes? [y/N] n
Certificate request data saved to /cm/local/apps/cmd/etc/cluster.csr.new
Submit certificate request to http://licensing.brightcomputing.com/licensing/ ? [Y/n] y
| Contacting | http://licensing.brightcomputing.com/licensing/... |     |     |     |     |
| ---------- | -------------------------------------------------- | --- | --- | --- | --- |
License granted.
| License | data was | saved   | to  | /cm/local/apps/cmd/etc/cluster.pem.new |     |
| ------- | -------- | ------- | --- | -------------------------------------- | --- |
| Install | license  | ? [Y/n] | n   |                                        |     |
Use "install-license /cm/local/apps/cmd/etc/cluster.pem.new" to install the license.
4.3.4 Installing A License With The install-licenseScript
Referring to the preceding request-license example output:
The administrator is prompted to enter the MAC address for eth0.
After the certificate request is sent to NVIDIA and approved,thelicenseisgranted.
Iftheprompt“Install license?”isansweredwitha“Y”(thedefault),theinstall-licensescript
is run automatically by the request-licensescript.
If the prompt is answered with an“n”thentheinstall-license script must be run explicitly later
on by the administrator in order to complete installation of the license. This is typically needed for
clusters that have no director proxy web access(page60).
The decision that is made at the prompt also has consequences for the reboot requirements of nodes.
These consequences are explained in detail in section4.3.7.

| 62  |     |     |     |     | Licensing NVIDIA Base Command Manager |
| --- | --- | --- | --- | --- | --------------------------------- |
The install-license script takes the temporary location of the new license file generated by
request-license as its argument, and installs related files on the head node. Running it completes
the license installation on the head node.
Example
Assuming the new certificate is saved as cluster.pem.new:
[root@basecm11 ~]# install-license /cm/local/apps/cmd/etc/cluster.pem.new
| =========      | Certificate | Information       | ======== |     |     |
| -------------- | ----------- | ----------------- | -------- | --- | --- |
| Version:       |             | 11.0              |          |     |     |
| Edition:       |             | Advanced          |          |     |     |
| Common         | name:       | basecm11          |          |     |     |
| Organization:  |             | ACME Inc.         |          |     |     |
| Organizational | unit:       | Development       |          |     |     |
| Locality:      |             | San Jose          |          |     |     |
| State:         |             | California        |          |     |     |
| Country:       |             | US                |          |     |     |
| Serial:        |             | 9463              |          |     |     |
| Starting       | date:       | 23 Dec 2012       |          |     |     |
| Expiration     | date:       | 31 Dec 2013       |          |     |     |
| MAC address:   |             | 08:0A:27:BA:B9:43 |          |     |     |
| Pre-paid       | nodes:      | 10                |          |     |     |
==========================================
| Is the     | license information | correct        | ? [Y/n] | y            |     |
| ---------- | ------------------- | -------------- | ------- | ------------ | --- |
| Installed  | new license         |                |         |              |     |
| Restarting | Cluster             | Manager Daemon | to use  | new license: | OK  |
4.3.5 Re-Installing A License After Replacing The Hardware
If a new head node is to be run on new hardware then:
• If the old head node is notable to run normally,then the new head node can have the head node
data placed on it from the old head node data backup.
• If the old head node is still running normally,then the new head node can have data placed on it
by a cloning action run from the old head node(section15.4.8of the Administrator Manual).
If the head node hardware has changed,then:
• a user with a subscription license can unlock the product key directly via https://customer.
brightcomputing.com/unlock.
• a user with a hardware license almost always has the license under the condition that it expires
when the hardware expires. Therefore,a user with a hardware license who is replacing the hard-
ware is almost always restricted from a license reinstallation. Users without this restriction may
request the account manager at NVIDIA to unlock the product key.
Using the product key with the request-license script then allows a new license to be requested,
which can then be installed by running the install-licensescript. Theinstall-licensescriptmay
notactuallybeneeded,but it does no harm to run it just in case afterwards.

4.3Requesting And Installing A License Using A Product Key 63
4.3.6 Re-Installing A License After Wiping Or Replacing The Hard Drive
If the head node hardware has otherwise not changed:
• The full drive image can be copied on to a blank drive and the system will work as before.
• Alternatively,if a new installation from scratch is done
– then after the installation is done, a license can be requested and installed once more using
the same product key, using the request-license command. Because the product key is
normally locked when the previous license request was done,a request to unlock the product
key usually needs to be sent to the account manager at NVIDIA before the license request can
beexecuted.
– If the administrator wants to avoid using the request-license command and having to type
in a product key, then some certificate key pairs must be placed on the new drive from the
| olddrive,inthesamelocations. |     | The procedure that can be followed is: |     |     |
| ---------------------------- | --- | -------------------------------- | --- | --- |
1. inthedirectory/cm/local/apps/cmd/etc/,the following key pair is copied over:
cluster.key
*
cluster.pem
*
Copying these across means that request-license does not need to be used.
2. Theadmin.{pem|key}key pair files can then be placed in the directory/root/.cm/cmsh/.
Twooptionsare:
the following key pair can be copied over:
*
· admin.key
· admin.pem
or
afreshadmin.{pem|key}key pair can be generated instead via acm d -boption:
*
Example
| [root@basecm11 | ~]#         | service cmd stop           |                     |              |
| -------------- | ----------- | -------------------------- | ------------------- | ------------ |
| [root@basecm11 | ~]#         | cmd -b                     |                     |              |
| [root@basecm11 | ~]#         | [...]                      |                     |              |
| Tue Jan        | 21 11:47:54 | [ CMD ] Info:              | Created certificate | in admin.pem |
| Tue Jan        | 21 11:47:54 | [ CMD ] Info:              | Created certificate | in admin.key |
| [root@basecm11 | ~]#         | [...]                      |                     |              |
| [root@basecm11 | ~]#         | chmod 600 admin.*          |                     |              |
| [root@basecm11 | ~]#         | mv admin.* /root/.cm/cmsh/ |                     |              |
| [root@basecm11 | ~]#         | service cmd start          |                     |              |
It is recommended for security reasons that the administrator ensure that unnecessary extra
certificate key pair copies no longer exist after installation on the new drive.
4.3.7 Re booting Nodes After An Install
The first time a product key is used: After using a product key with the command request-license
during a cluster installation for the first time,and then running install-license,arebootisrequiredof
all nodes in order for them to pickup and install their new certificates(section5.4.1oftheAdministrator
Manual). The install-license script has at this point already renewed the administrator certificates
on the head node that are for use with cms hand Base View. The parallel execution command pds h -g
computenode reboot suggested towards the end of the install-license script output is what can be
used to reboot all other nodes. Since such a command is best done by an administrator manually,pdsh
-g computenode rebootisnotscripted.

64 Licensing NVIDIA Base Command Manager
The subsequent times that the same product key, or another product key, is used: If a license has
become invalid, a new license may be requested. On running the command request-license for the
cluster, with the same product key, oranotherproductkey, the administrator is prompted on whether
tore-use the existing keys and settings from the existing license:
Example
[root@basecm11 ~]# request-license
Product Key (XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX): 061792-900914-800220-270420-077926
Existing license was found:
Country: US
State: None
Locality: None
Organization: None
Organizational Unit: None
Cluster Name: basecm11
You can choose whether to re-use private key and settings from existing license.
If you answer NO, existing certificates will be invalidated and nodes will have to be rebooted.
...
• If the existing keys are kept,apdsh -g computenode rebootisnotrequired.Thisisbecausethese
keysareX509v3certificates issued from the head node. Forthese:
– Anynodecertificates(section5.4.1of the Administrator Manual)that were generated using the
old certificate are therefore still valid and so regenerating them for nodes via are boot is not
required,allowing users to continue working uninterrupted. On reboot new node certificates
are generated and used if needed.
– User certificates (section 6.4 of the Administrator Manual) become invalid during certificate
regeneration when CMDaemon restarts itself. It is therefore advised to install a permanent
license as soon as possible, or alternatively, to not bother creating user certificates until a
permanent license has been setup for the cluster.
• If the existing keys are notre-used,then node communication ceases until the nodes are re booted.
If there are jobs running on BC M nodes,they cannot then complete.
After the license is installed, verifying the license attribute values is a good idea. Thiscanbedone
using the license infocomm and in cm sh, or by selecting the License info menu option from within
thePartition base window in Base View’sClusterresource(section4.1).
TheLicenseLogFile
License installation and changes are logged in
/var/spool/cmd/license.log
tohelpdebugissues.
4.3.8 Getting Help With Licensing Issues
The customer portal at https://enterprise-support.nvidia.com/s/create-case allows support tick-
ets to be submitted for licensing issues. Further details on this are in section14.2.1oftheAdministrator
Manual.

5
Linux Distributions That Use
Registration
This chapter describes setting up registered access for the NVIDIA Base Command Manager with the
Red Hat and S USE distributions.
The head node and regular node images can be setup with registered access to the enterprise Linux
distributions of Red Hat and S USE so that updates from their repositories can take place on the cluster
correctly. This allows the distributions to continue to provide support and security updates. Registered
access can also be set up in order to create an up-to-date custom software image (section 9.6 of the
AdministratorManual)if using Red Hat or S USE as the base distribution.
Registered access can be avoided for the head node and regular node images by moving the reg-
istration requirement to outside the cluster. This can be done by configuring registration to run from
a local mirror to the enterprise Linux distributions. The head node and regular node images are then
configured to access the local mirror repository. This configuration has the benefit of reducing the t raf-
fic between the local network and the internet. However it should be noted that the traffic from node
updates scales according to the number of regular node images,rather than according to the number of
nodesinthecluster. Inmostcases,therefore,the added complication of running a separate repository
mirror,is unlikely to be worth implementing.
5.1 Registering A Red Hat Enterprise Linux Based Cluster
To register a Red Hat Enterprise Linux(RHEL)system,Red Hat subscriptions are needed as described
athttps://www.redhat.com/. Registration with the Red Hat Network is needed to install new RHEL
packages or receive RHEL package updates,as well as carryout some other tasks.
5.1.1 Registering AHead Node With RHEL
An RHEL head node can be registered from the command line with the subscription-manager com-
mand. This uses the Red Hat subscription service username and password as shown:
[root@basecm11 ~]# subscription-manager register --username <username> --password <password> \
--auto-attach
The--auto-attach option allows a system to update its subscription automatically,sothatthesys-
t emends up with a valid subscription state.
If the head node has no direct connection to the internet,then an HTTP proxy can be configured as
acommandlineoption. Thesubscription-manager man pages give details on configuring the proxy
fromthecommandline.
Afterregistration, theyumsubscription-manager plugin is enabled. This means that yum can now
be used to install and update from the Red Hat Network repositories.
The list of enabled and disabled repositories can be seen with:

| 66             |     |              |     |     | Linux Distributions That Use Registration |     |
| -------------- | --- | ------------ | --- | --- | ------------------------------------- | --- |
| [root@basecm11 | ~]# | yum repolist | all |     |                                       |     |
5.1.2 Registering A Software Image With RHEL
subscription-manager
The command can be used to register an RHEL software image. If the head
node, on which the software image resides, has no direct connection to the internet, then an HTTP
proxy can be configured as a command line option. Thesubscription-manager man pages give details
on configuring the proxy from the command line.
The default software image,default-image,can be registered by mounting some parts of the files ys-
temimage, and then carrying out the registration within the image by using the Red Hat subscription
service username and password. This can be carried out on the head node, with the help of the BCM
cm-chroot-sw-imgtool(page530of the Administrator Manual)asfollows:
[root@basecm11 ~]# cm-chroot-sw-img /cm/images/default-image subscription-manager register --username \
| <username> --password |     | <password> | --auto-attach |     |     |     |
| --------------------- | --- | ---------- | ------------- | --- | --- | --- |
Afterregistration,theyumsubscription-manager plugin is enabled within the software image. This
means that yum can now be used to install and update the software image from the Red Hat Network
repositories.
The list of enabled repositories in the image can be seen with:
[root@basecm11 ~]# cm-chroot-sw-img /cm/images/default-image yum repolist
| repo id   |     |     | repo      | name     |                    |         |
| --------- | --- | --- | --------- | -------- | ------------------ | ------- |
| AppStream |     |     | AppStream | Packages | Red Hat Enterprise | Linux 9 |
| BaseOS    |     |     | BaseOS    | Packages | Red Hat Enterprise | Linux 9 |
...
| 5.2 Registering |     | A SUSE | Linux | Enterprise | Server Based | Cluster |
| --------------- | --- | ------ | ----- | ---------- | ------------ | ------- |
To register a SUSE Linux Enterprise Server system, SUSE Linux Enterprise Server subscriptions are
needed as described at http://www.suse.com/. Registration with S USE helps with installing newS LES
packages or receiving S LES package updates,as well as to carryout some other tasks.
5.2.1 Registering AHead Node With S USE
The s use connect command can be used to register aS USE15headnode. If the head node has no direct
connection to the internet, then the HTTP_PROXY and HTTPS_PROXY environment variables can be set,
to access the internet via a proxy. Running the registration command with the help option, “--help”,
provides further information about the command and its options.
The head node can be registered as follows:
[root@basecm11(cid:3)]# suseconnect -e <e-mail address> -r <registration code> -u https://scc.suse.com
The e-mail address used is the address that was used to register the subscription with SUSE. When
logged in on the SUSE site, the registration code can be found at the products overview page after
| selecting“SUSE | Linux | Enterprise | Server”. |     |     |     |
| -------------- | ----- | ---------- | -------- | --- | --- | --- |
Afterregistering,the S LES repositories are automatically added to the repository list and enabled.
The defined repositories can be listed with:
| [root@basecm11 | ~]# | zypper lr |     |     |     |     |
| -------------- | --- | --------- | --- | --- | --- | --- |
and the head node can be updated with:
| [root@basecm11 | ~]# | zypper refresh |     |     |     |     |
| -------------- | --- | -------------- | --- | --- | --- | --- |
| [root@basecm11 | ~]# | zypper update  |     |     |     |     |

5.2Registering AS USE Linux Enterprise Server Based Cluster 67
5.2.2 Registering A Software Image With S USE
The SUSEConnect command can be used to register a SUSE 15 software image. If the head node on
which the software image resides has no direct connection to the internet, then the HTTP_PROXY and
HTTPS_PROXY environment variables can be set to access the internet via a proxy. Runningthecommand
withthehelpoption,“--help”,provides further information about the command and its options.
The default software image default-image can be registered by running the following on the head
node:
| [root@basecm11(cid:3)]# | cm-chroot-sw-img |                      | /cm/images/default-image |     | \   |
| ----------------------- | ---------------- | -------------------- | ------------------------ | --- | --- |
| suseconnect             | -e <e-mail       | address>             | -r regcode-sles=         | \   |     |
| <activation             | code> -u         | https://scc.suse.com |                          |     |     |
The e-mail address is the address used to register the subscription with SUSE. When logged in on
theSUSEsite,the activation code or registration code can be found at the products overview page after
| selecting“SUSE | Linux | Enterprise | Server”. |     |     |
| -------------- | ----- | ---------- | -------- | --- | --- |
When running the registration command, warnings about the /sys or /proc filesystems can be ig-
nored. The command tries to query hardware information via these filesystems, but these are empty
filesystems in a software image,and only fill upon the node itself after the image is provisioned to the
node.
Instead of registering the software image, the SLES repositories can be enabled for the
default-image software image with:
[root@basecm11 ~]# cp /etc/zypp/repos.d/* /cm/images/default-image/etc/zypp/repos.d/
[root@basecm11 ~]# cp /etc/zypp/credentials.d/* /cm/images/default-image/etc/zypp/credentials.d/
[root@basecm11 ~]# cp /etc/zypp/service.d/* /cm/images/default-image/etc/zypp/service.d/
The copied files should be reviewed. Any unwanted repositories, unwanted service files, and un-
wanted credential files,mustberemoved.
The repository list of the default-image software image can be viewed with the ch root option,-R,
asfollows:
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | lr  |     |
| -------------- | --- | ---------------------------------- | --- | --- | --- |
and the software image can be updated with:
| [root@basecm11 | ~]# | export PBL_SKIP_BOOT_TEST=1        |     |         |       |
| -------------- | --- | ---------------------------------- | --- | ------- | ----- |
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | refresh |       |
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | update  |       |
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | clean   | --all |

6
Changing The Network
Parameters Of The Head Node
6.1 Introduction
After a cluster physically arrives at its site, the administrator often has to change the network settings
tosuitthesite. Details on this are given in section3.2.1of the Administrator Manual. However,itrelies
on understanding the material leading up to that section.
This chapter is therefore a quickstart document—conveniently a mere 3 pages—explaining how to
change basic IPv4 network settings while assuming no prior knowledge of NVIDIA Base Command
Manager and its network configuration interface.
6.2 Method
A cluster consists of ahead node,saybasecm11and one or more regular nodes. Theheadnodeofthe
cluster is assumed to face the internal network(the network of regular nodes)ononeinterface,sayeth0.
The external network leading to the internet is the non another interface,sayeth1. Thisisreferredtoas
atype1configuration in this manual(section3.3.9).
Typically,an administrator gives the head node a static external IP address before actually connect-
ing it up to the external network. This requires logging into the physical head node with the vendor-
supplied root password. The original network parameters of the head node can then be viewed and set.
Forexampleforeth1:
# cmsh -c "device interfaces basecm11; get eth1 dhcp"
yes
Here,yes means the interface accepts DHCP server-suppliedvalues.
Disabling DHCP acceptance allows a static IP address,forexample192.168.1.176,tobeset:
# cmsh -c "device interfaces basecm11; set eth1 dhcp no"
# cmsh -c "device interfaces basecm11; set eth1 ip 192.168.1.176; commit"
# cmsh -c "device interfaces basecm11; get eth1 ip"
192.168.1.176
Other external network parameters can be viewed and set in a similar way,asshownintable6.1. A
reboot implements the networking changes.
6.3 Terminology
A reminder about the less well-known terminology in the table:
• net mask bits is the net mask size,orprefix-length,inbits.InIPv4’s32-bitaddressing,thiscanbeup
to31bits,so it is a number between1and31. Forexample: networkswith256(28)addresses(i.e.

| 70  |     | Changing The Network Parameters Of The Head Node |     |     |     |     |
| --- | --- | ----------------------------------------- | --- | --- | --- | --- |
**Space-separated multiple values are also accepted for these parameters when setting the value for address or hostname. *Ifaddressissetto0.0.0.0then the value offered by the DHCP server on the external network is accepted Table6.1:
timeservers searchdomains nameservers gateway netmaskbits broadcastaddress baseaddress IP
NetworkParameter
∗
|     |     | ∗   |     |     |     | External Network Parameters And How To Change Them On The Head Node |
| --- | --- | --- | --- | --- | --- | -------------------------------------------------------- |
| ∗∗  |     |     |     |     | ∗   |                                                          |
∗,
∗∗
∗∗
∗
nameoftimeservers nameofsearchdomains name server IP addresses IPaddress gateway(defaultroute) length) (numberafter“/”,orprefix net maskin CIDR notation network broadcast IP address of address)ofnetwork baseIPaddress(network oneth1interface IPaddressofheadnode Description
set view set view set view set view set view set view set view set view
Operation
cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh CommandUsed
| -c -c | -c -c -c -c | -c -c | -c -c | -c -c | -c -c | -c -c |
| ----- | ----------- | ----- | ----- | ----- | ----- | ----- |
"partition; "partition "partition; "partition "partition; "partition "network; "network "network; "network "network; "network "network; "network "device "device
|              |                             |             |              |                   |              | interfaces interfaces |
| ------------ | --------------------------- | ----------- | ------------ | ----------------- | ------------ | --------------------- |
|              |                             | get         | get          | get               | get          |                       |
|              |                             | set         | set          | set               | set          |                       |
| get          | get get                     |             |              |                   |              |                       |
| set          | set set                     |             |              |                   |              |                       |
|              |                             | externalnet | externalnet  | externalnet       | externalnet  |                       |
|              |                             | externalnet | externalnet  | externalnet       | externalnet  |                       |
| base         | base base                   |             |              |                   |              |                       |
| base         | base base                   |             |              |                   |              |                       |
|              |                             |             |              |                   |              | basecm11; basecm11;   |
| timeservers" | searchdomains" nameservers" |             |              |                   |              |                       |
| timeservers  | searchdomains nameservers   |             |              |                   |              |                       |
|              |                             | gateway"    | netmaskbits" | broadcastaddress" | baseaddress" |                       |
|              |                             | gateway     | netmaskbits  | broadcastaddress  | baseaddress  |                       |
|              |                             |             |              |                   |              | set get               |
| address;     | address;                    |             |              |                   |              | eth1 eth1             |
address;
hostname;
|         |         |         | bitsize; |     | address; | ip ip"   |
| ------- | ------- | ------- | -------- | --- | -------- | -------- |
| commit" | commit" |         |          |     |          |          |
|         |         | commit" |          |     |          | address; |
address;
commit"
|     |     |     | commit" |     | commit" |     |
| --- | --- | --- | ------- | --- | ------- | --- |
commit"
commit"

6.3Terminology 71
with host addresses specified with the last8bits)haveanetmasksizeof24bits. Theyarewritten
in CIDR notation with a trailing“/24”,and are commonly spoken of as“slash24”networks.
• baseaddress is the IP address of the network the head node is on, rather than the IP address of
theheadnodeitself. The base address is specified by taking net mask bits number of bits from the
| IP address of the head node. |     | Examples: |     |     |
| ----------------------- | --- | --------- | --- | --- |
– A network with 256 (28) host addresses: This implies the first 24 bits of the head node’s
IP address are the network address, and the remaining 8 bits are zeroed. This is specified
by using “0” as the last value in the dotted-quad notation (i.e. zeroing the last 8 bits). For
|     | example: 192.168.3.0 |      |     |             |
| --- | -------------------- | ---- | --- | ----------- |
|     | –                    | (27) |     | netmaskbits |
A network with 128 host addresses: Here is 25 bits in size, and only the
last7bitsarezeroed. Indotted-quad notation this implies“128”asthelastquadvalue(i.e.
|     | zeroingthelast7bits). | Forexample: | 192.168.3.128. |     |
| --- | --------------------- | ----------- | -------------- | --- |
Whenindoubt,or if the preceding terminology is not understood,then the values to use can be calc u-
late d using the head node’ssipcalcutility. Touseit,the IP address in CIDR format for the head node
mustbeknown.
When run using a CIDR address value of192.168.3.130/25,theoutputis(some output removed for
clarity):
| # sipcalc    | 192.168.3.130/25 |                   |                 |     |
| ------------ | ---------------- | ----------------- | --------------- | --- |
| Host address |                  | - 192.168.3.130   |                 |     |
| Network      | address          | - 192.168.3.128   |                 |     |
| Network      | mask             | - 255.255.255.128 |                 |     |
| Network      | mask (bits)      | - 25              |                 |     |
| Broadcast    | address          | - 192.168.3.255   |                 |     |
| Addresses    | in network       | - 128             |                 |     |
| Network      | range            | - 192.168.3.128   | - 192.168.3.255 |     |
Runningitwiththe-b(binary)option may aid comprehension:
| # sipcalc    | -b 192.168.3.130/25 |                                       |     |     |
| ------------ | ------------------- | ------------------------------------- | --- | --- |
| Host address |                     | - 11000000.10101000.00000011.10000010 |     |     |
| Network      | address             | - 11000000.10101000.00000011.10000000 |     |     |
| Network      | mask                | - 11111111.11111111.11111111.10000000 |     |     |
| Broadcast    | address             | - 11000000.10101000.00000011.11111111 |     |     |
| Network      | range               | - 11000000.10101000.00000011.10000000 |     | -   |
11000000.10101000.00000011.11111111

7
Third Party Software
In this chapter, several third party software packages included in the BCM repository are described
briefly. Forallpackages,references to the complete documentation are provided.
The packages dashboard at https://service.bcm.nvidia.com/packages-dashboard/liststheavail-
able supported package versions per BC M version,architecture,anddistribution.
7.1 Modules Environment
RHELandderivatives,and S LES BC M package name: env-modules
Ubuntupackagename: cm-modules
The modules environment package is installed by default on the head node. The home page for the
software is at http://modules.sourceforge.net/). The software allows a user of a cluster to modify
the shell environment for a particular application, or even for a particular version of an application.
Typically,a module file defines additions to environment variables such as PATH,LD_LIBRARY_PATH,and
MANPATH.
Cluster users use the module command to load or remove modules from their environment. The
module(1)man page has more details about the command,and aspects of the modules environment that
are relevant for administrators are discussed in section2.2of the Administrator Manual. Alsodiscussed
thereisLmod,theLua-based alternative to the T cl-based traditional modules environment package.
The modules environment from a user’s perspective is covered in section2.3oftheUserManual.
7.2 Shorewall
Packagename: shorewall
7.2.1 The Shore wall Service Paradigm
BC M provides the Shoreline Firewall(morecommonlyknownas“Shorewall”)packagefromtheBCM
repository. The package provides firewall and gateway functionality on the head node of a cluster.
Shore wallis a flexible and powerful high-level interface for the net filter packet filtering framework.
Netfilter is a standard part of Linux kernels. As its building blocks, Shorewall uses iptables and
iptables6commands to configure net filter. All aspects of firewall and gateway configuration are han-
d led through the configuration files located under/etc/shorewall/.
Shorewall IPv4 configuration is managed with the shorewall command, while IPv6 configuration
is managed via the shore wall6command. IPv4filteringandIPv6filtering are treated as separate ser-
vicesinShorewall. Forconvenience,onlyIPv4Shore wallis described from here onward,becauseIPv6
management is largely similar.
After modifying Shore wall configuration files,Shore wall must be restarted to have the new config-
urationtakeeffect. Fromtheshellprompt,this can be carried out with:

74 ThirdPartySoftware
service shorewall restart
In NVIDIA Base Command Manager 11, Shorewall is managed by CMDaemon, in order to han-
dle theautomation ofcloud nodeaccess. RestartingShorewall canthus also becarried outwithin the
services submode (section 3.14 of the Administrator Manual) of cmsh on the head node. For example,
onaheadnodebasecm11are start of shore wall can be carried out with:
[basecm11->device[basecm11]->services[shorewall]]% restart
restart Successfully restarted service shorewall on: basecm11
System administrators may sometimes need to be aware that Shore wall does not really run asada e-
monprocess. Thatis,the command to restart the service does not stop and start ashore wall daemon.
Instead the command configures net filter using the ip tables settings specified in the shore wall config u-
rationfiles, andthenexits. It exits without leaving ashore wall process up and running, eventhough
service shorewall status implies that such a service is running.
7.2.2 ShorewallZones,Policies,AndRules
Inthedefaultsetup,Shore wall provides gateway functionality to the internal cluster network on the first
network interface (eth0). This network is known as the nat zone to Shorewall. The external network
(i.e. the connection to the outside world)is assumed to be on the second network interface(eth1). This
network is known as the net zone inShore wall.
Letting BCM take care of the network interfaces settings is recommended for all interfaces on the
headnode(section3.2of the Administrator Manual). Thefile/etc/shorewall/interfaces is generated
by the cluster management daemon,and any extra instructions that cannot be added via Base View or
cm sh can be added outside of the file section clearly demarcated as being maintained by CM Daemon.
Shorewall is configured by default (through /etc/shorewall/policy) to deny all incoming traffic
fromthenetzone,except for the traffic that has been explicitly allowed in/etc/shorewall/rules. Pro-
viding(asubsetof)the outside world with access to a service running on a cluster,canbeaccomplished
by creating appropriate rules in/etc/shorewall/rules.
A rule modification is typically needed if Shore wall denies access to a port, ontheheadnode, that
needs to be accessed from an external network. Theaccessmightbe,forexample,forcarryingoutport
forwarding from the head node to a compute node when using the port forward command(page115of
the Administrator Manual).
Bydefault,the cluster respond stoIC MP ping packets.Also,during cluster installation,thefollowing
ports are open by default,but can be set to be blocked by the administrator:
• SSH
• HTTP
• HTTPS
• port8081,which allows access to the cluster management daemon.
Thecm-cmd-portsUtility
Port8081is the default port that CM Daemon listens to when using the HTTPS protocol to manage the
nodes. If,forexample,a new software needs that port,thencm-cmd-ports utility can be used to set the
HTTPS protocol port that CM Daemon listens on to another port,suchas8082.
Example
[root@basecm11 ~]# cm-cmd-ports --https 8082
A restart of CMDaemon has the change take effect, and takes care of opening the firewall on port
8082 for CMDaemon, by adding a line to the rules file of Shorewall. The original port 8081 remains
open,but CM Daemon no longer listens to it.
The status of ports used by the cluster manager can be listed with:

7.2Shorewall 75
[root@basecm11 ~]# cm-cmd-ports -l
type http https firewall rule path
-------------- ------ ------- --------------- -------------------------------------------------------
image 8080 8082 /cm/images/default-image/cm/local/apps/cmd/etc/cmd.conf
image 8080 8082 True /cm/local/apps/cmd/etc/cmd.conf
node-installer 8082 /cm/node-installer/scripts/node-installer.conf
7.2.3 Clear And Stop Behavior In service Options,bashShellCommand,AndcmshShell
To remove all rules, for example for testing purposes, the clear option should be used from the Unix
shell. This then allows all network traffic through:
shorewall clear
Administrators should be aware that in the Linux distributions supported by BCM, the service
shorewall stop command corresponds to the unix shell shorewall stop command, and not to the
unixshellshorewall clearcommand. The stop option for the service and shell blocks network traffic
but allows a pre-defined minimal safe set of connections, and is not the same as completely remov-
ing Shorewall from consideration. The stop options discussed so far should not be confused with the
equivalent stop option in the cm sh shell under services mode under device mode.
This situation is indicated in the following table:
Correspondence of stop,clear,and restart inShore wall vs cm sh
iptablesrules Service UnixShell cmshshell
keepasafeset: service shore walls top shorewallstop noequivalent
clearallrules: noequivalent shorewallclear stopshorewall
start with stored rules: service shore wall restart shorewallrestart restartshorewall
7.2.4 AddingTo Shore wall Configuration Via A Role In cm sh
Thissection,about addingto Shore wall configuration via a role in cm sh,requires some familiarity with
BCM and Shorewall, and can be skipped at a first reading of the manuals. For convenience, cross-
references are provided within this section to the material that the administrator should have some
familiarity with before configuring Shore wall via a role.
The command line front end manager to BCM is cmsh (section 2.5 of the Administrator Manual).
Withincmsh,services are often implemented as roles(section2.1.5of the Administrator Manual).
Administrators that have become familiar with using roles within cm sh can carryout some Shore wall
configuration within the firewall role of the head node, via modes (section 2.5.2 of the Administrator
Manual)under the firewall role. Firewall modes were introduced in BC M version9.1.
Shorewall configuration can go far beyond just what can be done within the modes of firewall.
These modes are just the BC M way to add changes to some Shore wall firewall configurations,andare
aimed at making firewall management for the cluster easier.
BC M provides modes for modifying Shore wall files as indicated by the following table:

76 ThirdPartySoftware
| mode | usedformodifying: |     |     | Shore wall file man pages |
| ---- | ----------------- | --- | --- | --------------------- |
policies policiesin/etc/shorewall/policy https://shorewall.org/manpages/
shorewall-policy.html
routes routes/etc/shorewall/routes https://shorewall.org/manpages/
shorewall-routes.html
(not present
in Ubuntu clusters by default)
interfaces interfacesin/etc/shorewall/interfaces https://shorewall.org/manpages/
shorewall-interfaces.html
zones zonesin/etc/shorewall/zones https://shorewall.org/manpages/
shorewall-zones.html
openports portsin/etc/shorewall/rules https://shorewall.org/manpages/
shorewall-rules.html
Forexample,to add a policy to the BC M-managedsectionofthe/etc/shorewall/policyfileonthe
headnode,acm sh session can be run as follows:
Example
| [root@head                             | ~]# cmsh   |             |          |     |
| -------------------------------------- | ---------- | ----------- | -------- | --- |
| [head]%                                | device use | head; roles |          |     |
| [head->device[head]->roles]%           |            | use         | firewall |     |
| [head->device[head]->roles[firewall]]% |            |             | show     |     |
| Parameter                              |            |             | Value    |     |
-------------------------------- ------------------------------------------------
| Name |     |     | firewall |     |
| ---- | --- | --- | -------- | --- |
Revision
| Type                                             |               |              | FirewallRole           |      |
| ------------------------------------------------ | ------------- | ------------ | ---------------------- | ---- |
| Add services                                     |               |              | yes                    |      |
| Shorewall                                        |               |              | no                     |      |
| Open ports                                       |               |              | <0 in submode>         |      |
| Zones                                            |               |              | <0 in submode>         |      |
| Interfaces                                       |               |              | <0 in submode>         |      |
| Policies                                         |               |              | <0 in submode>         |      |
| Routes                                           |               |              | <0 in submode>         |      |
| [head->device[head]->roles[firewall]]%           |               |              | policies               |      |
| [head->device[head]->roles[firewall]->policies]% |               |              |                        | list |
| Index                                            | Source Dest   | Policy       | Log Options            |      |
| ------                                           | ------ ------ | ------------ | --------- ------------ |      |
The preceding output shows no additional policies are currently managed by BC Min that mode.Toadd
someBCM-managedpolicies,the administrator can check how to do it by typing in the add command
(section2.5.3of the Administrator Manual)withoutanyarguments:
| [head->device[head]->roles[firewall]->policies]% |     |     |     | add |
| ------------------------------------------------ | --- | --- | --- | --- |
Name:
|     | Create a | new firewallpolicy | with specified | policy |
| --- | -------- | ------------------ | -------------- | ------ |
Usage:
add <policy>
add <source>
|     | add <source> | <dest> |                          |     |
| --- | ------------ | ------ | ------------------------ | --- |
|     | add <source> | <dest> | <policy>                 |     |
|     | add <source> | <dest> | <policy> <log>           |     |
|     | add <source> | <dest> | <policy> <log> <options> |     |

7.2Shorewall 77
Examples:
add loc net ACCEPT
|     | add loc net ACCEPT | info |     |     |
| --- | ------------------ | ---- | --- | --- |
Based on the lookup and some familiarity with Shore wall’spolicyfile,the administrator can now com-
pose suitable arguments for the add command, and commit (section 2.5.3 of the Administrator Manual)
thechanges:
Example
[head->device[head]->roles[firewall]->policies]% add net fw ACCEPT info
[head->device*[head*]->roles*[firewall*]->policies[0]]% #preceding means accept all traffic from other subnets
| [head->device*[head*]->roles*[firewall*]->policies[0]]% |                     |                        | list |     |
| ------------------------------------------------------- | ------------------- | ---------------------- | ---- | --- |
| Index Source                                            | Dest Policy         | Log Options            |      |     |
| ------ ------                                           | ------ ------------ | --------- ------------ |      |     |
| 0 net                                                   | fw ACCEPT           | info                   |      |     |
[head->device*[head*]->roles*[firewall*]->policies[0]]% #next lines show how policy section changes on commit
[head->device*[head*]->roles*[firewall*]->policies[0]]% !head -4 /etc/shorewall/policy
# This section of this file was automatically generated by cmd. Do not edit manually!
| # BEGIN AUTOGENERATED                                   | SECTION | -- DO NOT REMOVE |        |     |
| ------------------------------------------------------- | ------- | ---------------- | ------ | --- |
| # END AUTOGENERATED                                     | SECTION | -- DO NOT REMOVE |        |     |
| [head->device*[head*]->roles*[firewall*]->policies[0]]% |         |                  | commit |     |
[head->device[head]->roles[firewall]->policies]% !head -4 /etc/shorewall/policy
# This section of this file was automatically generated by cmd. Do not edit manually!
| # BEGIN AUTOGENERATED | SECTION     | -- DO NOT REMOVE |     |     |
| --------------------- | ----------- | ---------------- | --- | --- |
| net fw                | ACCEPT info |                  |     |     |
| # END AUTOGENERATED   | SECTION     | -- DO NOT REMOVE |     |     |
After the commit command is run,the additional policy is placed and becomes active in the policy file.
7.2.5 Further Shore wall Quirks
Shore wallIs Normally Only On The Head Node
Shore wall always runs on the head node.
Shore wall can also run on the regular nodes,but does not run on them by default.
Inatype1networktopology(section3.3.9),running Shore wall on the regular nodes makes no real
sense from a security point of view. This is because the head node controls all the regular nodes, and
access to the regular nodes is through the head node firewall.
Fortype2andtype3topologies,turning Shore wall on for the regular nodes must be considered. It
can be turned on by setting the shore wall attribute in the firewall role for the node from off to on.
Example
| [basecm11->device*[node001*]->roles*[firewall*]]% |     |     | get shorewall |     |
| ------------------------------------------------- | --- | --- | ------------- | --- |
no
[basecm11->device*[node001*]->roles*[firewall*]]% !ssh node001 systemctl status shorewall.service
...
| Active: inactive | (dead) |     |     |     |
| ---------------- | ------ | --- | --- | --- |
...
| [basecm11->device*[node001*]->roles*[firewall*]]% |     |       | set shorewall | on  |
| ------------------------------------------------- | --- | ----- | ------------- | --- |
| [basecm11->device*[node001*]->roles*[firewall*]]% |     |       | commit ; show |     |
| Parameter                                         |     | Value |               |     |
-------------------------------- ------------------------------------------------
| Name |     | firewall |     |     |
| ---- | --- | -------- | --- | --- |
Revision

78 ThirdPartySoftware
Type FirewallRole
Add services yes
Shorewall yes
...
[basecm11->device[node001]->roles[firewall]]% !systemctl status shorewall.service
ssh: connect to host node001 port 22: Connection refused
Standard Distribution Firewall Should Be Disabled
Administrators should also be aware that RHEL and its derivatives run their own set of high-level
iptables setup scripts if the standard distribution firewall is enabled. To avoid conflict, the standard
distribution firewall, Firewalld, must stay disabled in RHEL8 and 9 and their derivatives. This is be-
cause BC M requires Shore wall for regular functioning. Shore wall can be configured to setup whatever
ip tables rules are installed by the standard distribution script instead.
Shore wall Stopped Outside Of BC M Considered Harmful
System administrators wishingto stop Shorewall shouldnote that BCM bydefault has the autostart
setting(section3.14of the Administrator Manual)settoon. Withsuchavalue,CMDaemonattemptsto
restart a stopped Shore wall if the service has been stopped from outside of cm shor Base View.
Stopping Shorewall outside of cmsh or Base View is considered harmful, because it can trigger a
failover. This is because stopping Shore wall blocks the fail over prevention monitoring tests. Thesetests
are the status ping and backup ping (both based on ICMP packet connections), and the CMDaemon
status (based on REST calls) (section 15.4.2 of the Administrator Manual). In most cases, with default
settings, Shorewall is not restarted in time, even when autostart is on, so that a failover then takes
place.
A failover procedure is quite a sensible option when Shorewall is stopped from outside of cmsh or
BaseView,because besides the fail over monitoring tests failing,other failures also make the head node
prettyuseless. The blocking of ports means that,amongstothers,workload managers and NFS shares
are also unable to connect. Ideally, therefore, Shorewall should not be stopped outside cmsh or Base
Viewinthefirstplace.
Full documentation on the specifics of Shore wallis available at http://www.shorewall.net.
7.3 The GCC Compiler
The GCC compiler maybe installed through yum,zypper,orapt(section9.2of the Administrator Manual).
Thepackagenamesare
• gcc-recent for RHEL and derivatives,andSLES
• cm-gccforUbuntu
The GCC suite that the distribution provides is also present by default.
An alternative to the GCC compiler is the Intel compiler,which is part of the one API toolkit,available
fromhttps://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html.Earlier
versions of BCM had the Intel compiler components available from the BCM repositories; this is no
longerthecaseforBCM10.0andonward.
7.4 AMD GPU Driver Installation
AMD GPUs required rivers to be installed in order to work.TheDKMSsystem,which is used to compile
kernel modules that are not part of the mainline kernel,is used for creating AMD GPU kernel modules
on the image to be used by the nodes that have GPUs.

7.4AMD GPU Driver Installation 79
7.4.1 AMDGPUHardwareCheck
A hardware check to see if the node has an AMD GPU is:
Example
| [root@node001 | ~]# lspci | | grep AMD |     |     |     |
| ------------- | --------- | ---------- | --- | --- | --- |
10\
00:06.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Vega
| [Instinct | MI25/MI25x2/V340/V320] |     |     |     |     |
| --------- | ---------------------- | --- | --- | --- | --- |
If the kernel has detected the AMD GPU,thenagrep amd gpu of the d mes g output shows all sorts of
messages that indicate that:
Example
| [root@node001 | ~]# dmesg    | | grep amdgpu |                  |                    |     |
| ------------- | ------------ | ------------- | ---------------- | ------------------ | --- |
| [ 157.942430] | [drm] amdgpu | kernel        | modesetting      | enabled.           |     |
| [ 157.945225] | amdgpu:      | CRAT table    | not found        |                    |     |
| [ 157.945241] | amdgpu:      | Virtual CRAT  | table created    | for CPU            |     |
| [ 157.945265] | amdgpu:      | Topology:     | Add CPU node     |                    |     |
| [ 158.211025] | amdgpu       | 0000:00:06.0: | amdgpu:          | Fetched VBIOS from | ROM |
| [ 158.211065] | amdgpu:      | ATOM BIOS:    | 113-D0513600-109 |                    |     |
[ 158.226062] amdgpu 0000:00:06.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
| [ 159.253402] | amdgpu | 0000:00:06.0: | amdgpu: | MEM ECC is active. |     |
| ------------- | ------ | ------------- | ------- | ------------------ | --- |
[ 159.253418] amdgpu 0000:00:06.0: amdgpu: SRAM ECC is not presented.
[ 159.253465] amdgpu 0000:00:06.0: amdgpu: VRAM: 16368M 0x000000F400000000 - 0x000000F7FEFFFFFF (16368M used)
...
7.4.2 AMD GPU Driver Installation Per Supported Distribution
Across the distributions—RHELandderivatives,Ubuntu,andSLES—the procedure to install the GPU
drivers is very similar.
Cloning AnImage For AMD GPU Nodes
Inalldistributions,thedefault-image can first be cloned to animage that is to be the AMD GPU image,
forexampleam:
Example
| [root@basecm11:~]#               | cmsh          |       |               |     |     |
| -------------------------------- | ------------- | ----- | ------------- | --- | --- |
| [basecm11]%                      | softwareimage |       |               |     |     |
| [basecm11->softwareimage]%       |               | clone | default-image | am  |     |
| [basecm11->softwareimage*[am*]]% |               |       | commit        |     |     |
[basecm11->softwareimage[am]]%
[notice] basecm11: Started to copy: /cm/images/default-image -> /cm/images/am (4117)
...
[notice] basecm11: Initial ramdisk for image am was generated successfully
| [basecm11->softwareimage[am]]% |     | quit |     |     |     |
| ------------------------------ | --- | ---- | --- | --- | --- |
AMD Instructions For Installing The Driver Packages On AMD GPU Nodes
Instructions from AMD describe how to install the driver packages. At the time of writing (February
2024)the instructions are at:
https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.
html
The instructions describe two ways of installing the driver:
1. configuring the AMD driver repository for the package manager,and then installing the driver via
standard package manager commands and OS changes

80 ThirdPartySoftware
2. installing an AMD GPU installer that takes care of the installation
In either case, the instructions that are followed must be the ones for the OS release version of the
software image that is on the AMD GPU nodes. The release version can be found with:
Example
| root@basecm11:~#   | grep PRETTY | /etc/os-release |        |
| ------------------ | ----------- | --------------- | ------ |
| PRETTY_NAME="Rocky | Linux       | 9.2 (Blue       | Onyx)" |
Installing The Driver Packages On AMD GPU Nodes On The Node Images Via Ch root
The installation must be done in the image. This is done using a chroot into the image, and using a
bind mount to have some special filesystem directories (/proc, /sys, and similar) be available during
| the package installation. | This is needed for the D KMS installation. |     |     |
| ----------------------- | ----------------------------------- | --- | --- |
Bind mounting the filesystems and the nch rooting is a little tedious,sothecm-chroot-sw-imgutility
(page530of the Administrator Manual)is used to automate the job.
The following session output illustrates(withmuchtextelided)the procedure for the second of the
two ways of installing the driver. Thatis,installing and running the AMD GPU installer on a software
image:
The ch rooted image created earlier(am)isfirstentered:
Example
| [root@basecm11 | ~]# cm-chroot-sw-img |     | /cm/images/am/ |
| -------------- | -------------------- | --- | -------------- |
mounted /cm/images/default-image/dev
mounted /cm/images/default-image/dev/pts
...
Theamdgpu-install package can then be installed,as per the AMD instructions. Thepackagepro-
vi des the AMD GPU installer(amdgpu-install),which is run in ach rooted image to install the ROC m
stack.Installation takes a while,with much of the time taken up by the compilation steps that are carried
outfortheDKMSparts.
• ForRHEL9.2and derivatives the procedure looks like:
Example
| [root@am | /]# urldomain=https://repo.radeon.com |     |     |
| -------- | ------------------------------------- | --- | --- |
[root@am /]# urlpath=/amdgpu-install/6.0.2/rhel/9.2/amdgpu-install-6.0.60002-1.el9.noarch.rpm
| [root@am | /]# yum install | $urldomain$urlpath |     |
| -------- | --------------- | ------------------ | --- |
...
| [root@am | /]# amdgpu-install |     | --usecase=graphics,rocm |
| -------- | ------------------ | --- | ----------------------- |
...
The exact path depends on which version is used.
• ForUbuntu22.04(JammyJellyfish)the procedure looks like:
Example
| root@am:/# | urldomain=https://repo.radeon.com |     |     |
| ---------- | --------------------------------- | --- | --- |
root@am:/# urlpath=/amdgpu-install/6.0.2/ubuntu/jammy/amdgpu-install_6.0.60002-1_all.deb
| root@am:/# | wget $urldomain$urlpath |     |     |
| ---------- | ----------------------- | --- | --- |
...
| root@am:/# | apt install | ./amdgpu-install_6.0.60002-1_all.deb |     |
| ---------- | ----------- | ------------------------------------ | --- |
...
| root@am:/# | amdgpu-install |     | --usecase=rocm |
| ---------- | -------------- | --- | -------------- |
...

7.4AMD GPU Driver Installation 81
• ForSLES15theprocedureforSLES15sp5lookslike:
Example
| am:/ | # urldomain=https://repo.radeon.com |     |     |     |     |
| ---- | ----------------------------------- | --- | --- | --- | --- |
am:/ # urlpath=/amdgpu-install/latest/sle/15.5/amdgpu-install-6.0.60000-1.noarch.rpm
| am:/ | # zypper | --no-gpg-checks |     | install | $urldomain$urlpath |
| ---- | -------- | --------------- | --- | ------- | ------------------ |
...
| am:/ | # amdgpu-install |     | --usecase=graphics,rocm |     |     |
| ---- | ---------------- | --- | ----------------------- | --- | --- |
...
The exact path depends on which service pack(sp)version is in use on the node.
ReplacingTherocm-s mi Package With A Package From BC MOn The AMD GPU Nodes Image
rocm-smi
Running the AMDGPU installer installs the command, which is used for some monitoring
tasks related to AMD GPUs. BCM requires its own version of this command to collect AMD GPU
statistics. If such statistics are needed, then the BCM cm-rocm-smi package should be installed in the
imagetoo,to provide the BC M version:
| [root@am | /]# yum | install | cm-rocm-smi | for RHEL and derivatives |     |
| -------- | ------- | ------- | ----------- | --------------------- | --- |
ForUbuntu,the equivalent installation command is apt install cm-rocm-smi,whileforSLESitis
| zypper | install | cm-rocm-smi. |     |     |     |
| ------ | ------- | ------------ | --- | --- | --- |
The chroot for the prepared image can now be exited, which automatically unmounts the bind
mounts:
Example
| [root@am | /]# exit              |     |     |     |     |
| -------- | --------------------- | --- | --- | --- | --- |
| umounted | /cm/images/am/dev/pts |     |     |     |     |
| umounted | /cm/images/am/dev     |     |     |     |     |
| umounted | /cm/images/am/proc    |     |     |     |     |
| umounted | /cm/images/am/sys     |     |     |     |     |
| umounted | /cm/images/am/run     |     |     |     |     |
Using The Image For The AMD GPU Nodes
The nodes that are to use the driver should then be set to use the new image,andshouldberebooted:
Example
| [root@basecm11                 | ~]#    | cmsh        |                   |         |     |
| ------------------------------ | ------ | ----------- | ----------------- | ------- | --- |
| [basecm11]%                    | device | use node001 |                   |         |     |
| [basecm11->device[node001]]%   |        |             | set softwareimage |         | am  |
| [basecm11->device*[node001*]]% |        |             | commit            |         |     |
| [basecm11->device[node001]]%   |        |             | reboot            | node001 |     |
Normal nodes without the AMD GPU also bootup without crashing if they are set to use this image,
but will not be able to run Open CL programs.
After the configuration file has been placed, the ldconfig command is run, still within chroot, to
link the library in the image(s).

8
|     |     | The | NVIDIA | HPC | SDK |
| --- | --- | --- | ------ | --- | --- |
The NVIDIA HPC software development kit (https://developer.nvidia.com/hpc-sdk) is a suite of
compilers,libraries,andothertoolsforHPC.
Featuresinclude:
• The NVIDIA HPC SDK C, C++, and Fortran compilers that support GPU acceleration of HPC
modeling and simulation applications with standard C++andFortran,OpenACCdirectives,and
CUDA.
• GPU-accelerated math libraries that maximize performance on common HPC algorithms,andop-
timized communications libraries enable standards-based multi-GPU and scalable systems pro-
gramming.
• Performance profiling and debugging tools that simplify porting and optimization of HPC app li-
cations
• Container iz ation tools that enable easy deployment on-premises or in the cloud.
• SupportforARM,OpenPOWER,x86-64CPUs,aswellasNVIDIAGPUs,runningLinux
| 8.1 Packages | And | Versions |     |     |     |
| ------------ | --- | -------- | --- | --- | --- |
The main NVIDIA HPC SDK package is available as a package cm-nvhpc. The cm-nvhpc package, in
turn, depends on a package with the naming format cm-nvhpc-cuda<number>. Here, <number> is a
CUDAversionnumber.
The latest CUDA version number that is compatible with the cm-nv hpc package version at the time
of release is set as the package dependency.Older CUDA packages are optional but can also be installed.
A command line way to check the release versions and availability is as indicated by the following
outputs for a Rocky Linux9.3cluster:
Example
| [root@basecm11 | ~]# yum | info cm-nvhpc    | | grep ^Version |     |     |
| -------------- | ------- | ---------------- | --------------- | --- | --- |
| Version        | : 25.3  |                  |                 |     |     |
| [root@basecm11 | ~]# yum | install cm-nvhpc |                 |     |     |
...
| Installing | dependencies: |     |     |     |     |
| ---------- | ------------- | --- | --- | --- | --- |
cm-nvhpc-cuda12.8
..
| [root@basecm11 | ~]# yum | search cm-nvhpc-cuda* |     |     |     |
| -------------- | ------- | --------------------- | --- | --- | --- |
...
| cm-nvhpc-cuda11.8.x86_64 |     | : NVIDIA | HPC SDK |     |     |
| ------------------------ | --- | -------- | ------- | --- | --- |
| cm-nvhpc-cuda12.6.x86_64 |     | : NVIDIA | HPC SDK |     |     |
| cm-nvhpc-cuda12.8.x86_64 |     | : NVIDIA | HPC SDK |     |     |

84 TheNVIDIAHPCSDK
The preceding output is what was available at the time of writing (June 2025). The output can be
expectedtochange.
A browser-based way to check the cm-nvhpc versions and CUDA availability situation for BCM
versions,distributions and architecture is to use cm-nv hpc as a string in the distributed packages list for
BCMathttps://service.bcm.nvidia.com/packages-dashboard
| 8.2 Compiler | Modules |     |     |
| ------------ | ------- | --- | --- |
Thecm-nv hpc package makes several environment modules available for compiling:
’ ’
| [root@basecm11 | ~]# module | avail | grep | -o -P nvhpc.*?/ |
| -------------- | ---------- | ------------ | --------------- |
nvhpc-hpcx-cuda11/
nvhpc/
nvhpc-hpcx-cuda12/
nvhpc-byo-compiler/
nvhpc-hpcx/
nvhpc-hpcx-2.20-cuda12/
nvhpc-nompi/
Thenvhpc-hpcx-cuda11ornvhpc-hpcx-cuda12environment module sets up the HPC-Xlibraryen-
v ironmen t with the selected CUDA version.
Thenvhpc-hpc x environment module sets up the HPC-Xlibraryenvironment. Thisisanalternative
totheOpenMPI3.xlibrary.
The nom pi tag implies that paths to theM PI binaries and MP I libraries that come with cm-nvhpcare
notset,so that noM PI library is used from the package. An external MP I library can then be used with
thenvhpc-nompicompiler.
The nv hpc environment module is the standard HPC SDK.
The by o tag is an abbreviation for’bring-your-own’, and means that the general compiler en v iron-
mentforC,C++andFortranarenotset.
8.3 Viewing Installed Available CUDA Versions, And The Running CUDA
Version
The installed available CUDA versions for nv hpc can be viewed with:
Example
| [root@basecm11] | ~# module   | load shared | nvhpc                        |
| --------------- | ----------- | ----------- | ---------------------------- |
| [root@basecm11] | ~# basename | -a $(ls     | -1d $NVHPC_ROOT/cuda/[0-9]*) |
12.6
12.8
The running CUDA version for nv hpc can be viewed with:
Example
| [root@basecm11   | ~]# nvcc                     | --version          |          |
| ---------------- | ---------------------------- | ------------------ | -------- |
| nvcc: NVIDIA     | (R) Cuda                     | compiler driver    |          |
| Copyright        | (c) 2005-2025                | NVIDIA Corporation |          |
| Built on         | Fri_Feb_21_20:23:50_PST_2025 |                    |          |
| Cuda compilation | tools,                       | release 12.8,      | V12.8.93 |
Build cuda_12.8.r12.8/compiler.35583870_0

8.4Changing The Running CUDA Version 85
8.4 Changing The Running CUDA Version
In the preceding example, CUDA version 12.8 is the default version, while CUDA version 12.6 is also
seentobeavailable.
The CUDA version that is used can be changed on the nodes where nv hpc and the CUDA versions
havebeeninstalled.
Forexample,the version can be changed to version12.6,asfollows,for:
• nvhpccluster-wide:
[root basecm11] # makelocalrc ${NVHPC_ROOT}/compilers/bin -cuda 12.6 -x
• nv hpc on a specific head or compute node,as specified by hostname -s:
[root basecm11] # makelocalrc ${NVHPC_ROOT}/compilers/bin -cuda 12.6 -o > \
${NVHPC_ROOT}/compilers/bin/localrc.$(hostname -s)
• nv hpc for a specific user on a specific head or compute node,as specified by hostname -s:
[root basecm11] # makelocalrc ${NVHPC_ROOT}/compilers/bin -cuda 12.6 -o > \
${HOME}/localrc.$(hostname -s)
If the nv hpc compiler is run then:
1. the${NVHPC_ROOT}/compilers/bin/local rc configuration file is read,
2. followed by a second configuration file,which—ifitexists—iseither:
• the${NVHPC_ROOT}/compilers/bin/localrc.$(hostname -s)configurationfile
or
• the${HOME}/localrc.$(hostname -s)configurationfile
The second configuration file overwrites any settings set with${NVHPC_ROOT}/compilers/bin/localrc
If the ${NVHPC_ROOT}/compilers/bin/localrc.$(hostname -s) configuration file exists, then a
${HOME}/localrc.$(hostname -s)isignored.

9
CUDA For GPUs
The optional CUDA packages should be deployed in order to take advantage of the computational
capabilities of NVIDIA GPUs. The packages may already be in place,and ready for deployment on the
cluster,depending on the particular BC M software that was obtained. If the CUDA packages are not in
place,then they can be picked up from the BC M repositories,oralocalmirror.
9.1 Installing CUDA
9.1.1 CUDA Packages Available
At the time of writing of this section (April 2026), the CUDA 13.1 package is the most recent version
available in the BC MY UM,zypper,andAPTrepositories. The available versions are updated typically
in the next point release version of NVIDIA Base Command Manager after the upstream changes are
made available. An up-to-date list of packages available for a particular distribution and architecture
canbeviewedathttps://service.bcm.nvidia.com/packages-dashboard/.
Thus, for example, at the time of writing, Rocky Linux 9.6 has many CUDA versions available,
in the range from CUDA 11.7 to CUDA 13.1 for the x86_64 architecture, while Ubuntu 24.04 just has
CUDA12.5,CUDA12.6,CUDA12.8,CUDA12.9,CUDA-13.0,andCUDA13.1forx86_64.
Example: CUDA Packages Available For Ubuntu24.04
At the time of writing of this section(April2026),a cluster administrator can manage these packages for
Ubuntu24.04:

88 CUDAForGPUs
| Package |     | Type | Description |
| ------- | --- | ---- | ----------- |

cuda12.5-toolkit 
| c u d a 1 2 . | 6 - t o o l k i t |     |     |
| ------------- | ----------------- | --- | --- |
| c u d a 1 2 . | 8 - t o o l k i t |     |     |
shared CUDA math libraries and utilities
| c u d a 1 2 . | 9 - t o o l k i t |  |     |
| ------------- | ----------------- | ---------- | --- |
| c u d a 1 3 . | 0 - t o o l k i t |            |     |
| c u d a 1 3 . | 1 - t o o l k i t |            |     |

cuda12.5-visual-tools

| c u d a 1 2 . | 6 - v i s u a l - t | o o l s |     |
| ------------- | ------------------- | ------- | --- |
| c u d a 1 2 . | 8 - v i s u a l - t | o o l s |     |
shared CUDAvisualtoolkit
| c u d a 1 2 . | 9 - v i s u a l - t | o o l s |     |
| ------------- | ------------------- | ------- | --- |

| c u d a 1 3 . | 0 - v i s u a l - t | o o l s |     |
| ------------- | ------------------- | ------- | --- |
| c u d a 1 3 . | 1 - v i s u a l - t | o o l s |     |

cuda12.5-sdk

| c u d a 1 2 . | 6 - s d k |     |     |
| ------------- | --------- | --- | --- |
| c u d a 1 2 . | 8 - s d k |     |     |
shared CUDA software development kit
| c u d a 1 2 . | 9 - s d k |  |     |
| ------------- | --------- | ---------- | --- |
| c u d a 1 3 . | 0 - s d k |            |     |
| c u d a 1 3 . | 1 - s d k |            |     |
nvidia-driver∗∗,†
local CUDA GPU driver and libraries.
| cuda-dcgm |     | local | CUDA DataCenter GPU Manager(DCGM). |
| --------- | --- | ----- | ------------------------------- |
This includes the dc g miC LI tool.
(cid:41)
nvidia-fabricmanager∗,∗∗
local FabricManagertools
nvidia-fabricmanager-dev∗,∗∗
*optional,intended only for hardware containing an NVS witch,suchasaDGXsystem
**installed by default on software images,notonheadnodes
†the driver typically has a version number tag such as-590.
• The packages of type shared in the preceding table should be installed on the head nodes of a
clusterusingCUDA-compatibleGPUs.
• The packages of type local should be installed to all nodes that access the GPUs. In most cases
thismeansthatthe
– nvidia-driver(NVIDIA driver meta package)
cuda-dcgm(NVIDIA DataCenter GPU Manager)
–
– nvidia-fabricmanager(Fabric Manager for NVS witch based systems)
– nvidia-fabricmanager-dev(Fabric Manager API headers and associated library)
packages should be installed in a software image(section2.1.2of the Administrator Manual).Byde-
fault,BC M software images already have these packages,which means that an explicit installation
by the cluster administrator should not be required.

9.1InstallingCUDA 89
If a head node also accesses GPUs, then the nvidia-driver and cuda-dcgm packages should be
installedonit,too.
For packages of type shared,the particular CUDA version that is run on the node can be selected via
a modules environment command. Forexample,to select CUDA SDK version13.0,theusercanrun:
Example
user@basecm11:~$ module add shared cuda13.0
Release notes and features list for the CUDA packages:
• Release notes for the NVIDIA toolkit can be found at:
https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html
• The features list for the NVIDIA toolkit can be found at:
https://docs.nvidia.com/cuda/cuda-features-archive/index.html
CUDA packages that the cluster administrator normally does not manage: Asanaside,therearealso
the additional CUDA DC GM packages:
Package Type Description Installation on GPU node
cuda-dcgm-libs local NVIDIADCGMlibraries installedbydefault
cuda-dcgm-devel local NVIDIA DC GM development files not installed by default
cuda-dcgm-nvvs local NVIDIA DC GM validation suite installed by default, except
forinRHEL8,andexceptfor
inaDGXnode
At the time of writing of this paragraph(April2026)the latest DC GM version supported by BC M was
4.5.2. Runninga
• dnf info cuda-dcgm; dnf list cuda-dcgmforRHEL-familydistributions
• apt show -a cuda-dc gm for Ubuntu distributions
should reveal the currently installed and available versions for the cluster.
• Release notes for the DCGM versions are available at https://docs.nvidia.com/datacenter/
dcgm/latest/release-notes/changelog.html.
CUDA Package That The Cluster Administrator May Wish To Install For CUDA Programming
CUB is a CUDA programming library that developers may wish to access. It is available for some
distributions for some older CUDA versions,and provided by the package cm-cub-cuda.
CUDA Package Installation Basic Sanity Check
• The NVIDIA GPU hardware should be detectable by the kernel, otherwise the GPUs cannot be
usedbythedrivers. Running the ls pci command on the device with the GPU before the CUDA
package driver installation is a quick checkthat should make it clearif the NVIDIA hardware is
detected in the first place:
Example
runninglspcionnode001. Here4GPUsaredetected:

| 90  |     |     |     |     | CUDAForGPUs |
| --- | --- | --- | --- | --- | ----------- |
|     |     | ’   | ’   |     |             |
[root@node001]# { lspci | grep 3D controller: NVIDIA ;} && echo "NVIDIA GPU hardware detected by kernel"
| 0008:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| ------------ | -------------- | ------------------ | ------ | ------------- | --- |
| 0009:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| 0018:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| 0019:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| NVIDIA       | GPU hardware   | detected by kernel |        |               |     |
[root@node001]#
If the hardware is not detected by the kernel already, then the administrator should reassess the
situation.
TheDevice 2941part of the string can be tallied against the identifiers in the README.txt.gzfile
ofthenvidia-driver-580packageseries,at the node where it has been installed.
Example
root@basecm11:~# zgrep 2941 /cm/images/default-image/usr/share/doc/nvidia-driver-580/README.txt.gz
| NVIDIA | GB200 |     |     | 2941 10DE 2046 | K   |
| ------ | ----- | --- | --- | -------------- | --- |
| NVIDIA | GB200 |     |     | 2941 10DE 20CA | K   |
| NVIDIA | GB200 |     |     | 2941 10DE 20D5 | K   |
| NVIDIA | GB200 |     |     | 2941 10DE 21C9 | K   |
| NVIDIA | GB200 |     |     | 2941 10DE 21CA | K   |
The output of the ls pci command can be more directly informative for some hardware:
Example
| root@basecm11:~# | ssh | node001 "lspci | grep | 3D controller: | NVIDIA" |     |
| ---------------- | --- | --------------------- | -------------- | ------- | --- |
00:06.0 3D controller: NVIDIA Corporation GA100 [A100 PCIe 40GB] (rev a1)
root@basecm11:~# zgrep A100 /cm/images/default-image/usr/share/doc/nvidia-driver-580/README.txt.gz \
| | grep | -i PCIE | grep | 40GB |     |                |     |
| ------ | -------------- | ---- | --- | -------------- | --- |
| NVIDIA | A100-PCIE-40GB |      |     | 20F1 10DE 145F | J   |
• Only after CUDA package installation has taken place,and after re booting the node with the GPU,
and allowing CM Daemon sometime(afewminutes)todetectthechange,are GPU details visible
using the s ys infocomm and:
Example
runnings ys info on node001,which is where the GPUs are,via cm shon the head node,whilecuda-dcgm
isnotyetready:
| [root@basecm11               | ~]#    | cmsh        |          |     |     |
| ---------------------------- | ------ | ----------- | -------- | --- | --- |
| [basecm11]%                  | device | use node001 |          |     |     |
| [basecm11->device[node001]]% |        | sysinfo |   | grep GPU |     |     |
Example
runnings ys info on node001,via cm shon the head node,aftercuda-dcgmisready. 4GPUsaredetected

9.1InstallingCUDA 91
| [basecm11->device[node001]]%       |         |         |     | sysinfo |       | grep GPU   |
| ---------------------------------- | ------- | ------- | --- | --------------- | ---------- |
| [maple->device[dgx-gb200-n01-c1]]% |         |         |     | sysinfo         | | grep GPU |
| Motherboard                        |         | Name    |     | GB200 1CPU:2GPU | Board PC   |
| Number                             | of GPUs |         |     | 4               |            |
| GPU[0-3]                           | name    |         |     | NVIDIA Graphics | Device     |
| GPU[0-3]                           | power   | limit   |     | 1.20KW          |            |
| GPU[0-3]                           | BIOS    |         |     | 97.00.6C.00.03  |            |
| GPU[0-3]                           | driver  | version |     | 570.82          |            |
| GPU[0-3]                           | nvlink  |         |     | 2 up            |            |
CUDA Package Installation Guidelines For Compilation With Login Nodes
• CUDA compilation should take place on anode that uses NVIDIA GPUs during compilation.
– Using a workload manager to allocate this task to GPU nodes is recommended.
• Cross compilation of CUDA software with a CPU is generally not a best practice due to resource
consumption,which can even lead to crashes.
– If, despite this, cross compilation with a CPU is done, then the nvidia-driver package
should be installed on the node on which the compilation is done,andtheGPU-relatedser-
vicesonthenode,suchas:
nvidia-persistenced.service
*
nvidia-fabricmanager.service
*
* nvidia-dcgm.service
shouldbedisabled.
9.1.2 CUDA Package And Modules
The CUDA packages require access to the BC M repositories and to the distribution repositories.
Thenvidia-driver packages replace the older cuda-driver packages that were used inversions of
BCMpriortoversion11. The newer packages do not compile the driver modules source at boot time,
but during package installation. The newer packages are also opensource.
Example
Forexample,onaclusterwhere(someof)thenodesaccessGPUs,but the head node does not access a
GPU,the following commands install the CUDA13.0packages on the head using APT:
root@mycluster:~# apt install cuda13.0-toolkit cuda13.0-sdk cuda13.0-visual-tools
Thenvidia-driver-,cuda-dcgm,cuda-dcgm-nvvs,andnvidia-fabric manager are already installed
by default on the default software image,whichisdefault-imageonanewly-installed default cluster.
Carrying out an explicit installation or image update for these is therefore normally not needed.
In cases where it is required,then manual installation into a software image is described in section9.4
of the Administrator Manual,while running the image update command(section5.6oftheAdministrator
Manual),forexampleonnodes1to10,canbecarriedoutwith:
Example
| [root@mycluster      | ~]#    | cmsh        |     |                 |     |
| -------------------- | ------ | ----------- | --- | --------------- | --- |
| [mycluster]%         | device |             |     |                 |     |
| [mycluster->device]% |        | imageupdate |     | -n node0[01-10] | -w  |
If the CUDA packages have been set up on the cluster, then the end user typically just switches
between CUDA environments with a module change(section2.2of the Administrator Manual and sec-
tion2.3oftheUserManual).
Example
| module purge | && module | load | shared | cuda13.0/toolkit |     |
| ------------ | --------- | ---- | ------ | ---------------- | --- |

92 CUDAForGPUs
| 9.2 Verifying | CUDA |     |     |     |
| ------------- | ---- | --- | --- | --- |
The cuda*-sdk packages provide CUDA SDK sources that can be used to compile libraries and tools
that are not part of the CUDA toolkit,but used by CUDA software developers,such as the device Query
binary(section9.2).
An extensive method to verify that CUDA is working is to run the verify_cuda<version>.shscript,
located in the CUDA SDK directory. Thevalueof<version>canbe13.0,forexample.
This script first copies the CUDA SDK source to a local directory under /tmp or /local. It then
builds CUDA test binaries. Tobuildthemakefiles,the compilation may need c make,installedfromthe
cm-make package into the image(section9.4of the Administrator Manual).
These binaries clutter up the disk and are not intended for use as regular tools,sotheadministrator
is urged to remove them after they are built and run.
A help text showing available script options is displayed when “verify_cuda<version>.sh -h” is
run.
Atypical run output is as follows(someoutputelided):
Example
| root@node001:~# | module       | load shared | cuda13.0/toolkit |     |
| --------------- | ------------ | ----------- | ---------------- | --- |
| root@node001:~# | cd $CUDA_SDK |             |                  |     |
root@node001:/cm/shared/apps/cuda13.0/sdk/13.0.2# ./verify_cuda13.0.sh
| Copy cuda13.0 | sdk files | to "/tmp/cuda13.0" |     | directory. |
| ------------- | --------- | ------------------ | --- | ---------- |
cmake
| make (may    | take a while)         |     |          |     |
| ------------ | --------------------- | --- | -------- | --- |
| Run multiple | tests non-interactive |     | ? (y/N)? |     |
Executing: /tmp/cuda13.0/build/CMakeFiles/3.26.3/C Make Determine Compiler ABI_CUDA.bin
80cmd: /tmp/cuda13.0/build/CMakeFiles/3.26.3/C Make Determine Compiler ABI_CUDA.bin - rc : 0
| Executing: | /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_C.bin |     |     |     |
| ---------- | ------------------------------------------------------ | --- | --- | --- |
INFO:OpenMP-date[201511]
cmd: /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_C.bin - rc : 0
| Executing: | /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_CXX.bin |     |     |     |
| ---------- | -------------------------------------------------------- | --- | --- | --- |
INFO:OpenMP-date[201511]
cmd: /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_CXX.bin - rc : 0
| Executing: | /tmp/cuda13.0/build/Samples/0_Introduction/clock/clock |     |     |     |
| ---------- | ------------------------------------------------------ | --- | --- | --- |
...
Test passed
cmd: /tmp/cuda13.0/build/Samples/6_Performance/cuda Graphs Per f Scaling/cuda Graphs Per f Scaling - rc : 0
All cuda13.0 compiled test programs can be found in the "/tmp/cuda13.0/build/" directory
Alternatively the "run_tests.py" can be run in the "/tmp/cuda13.0" directory.
For example:
cd /tmp/cuda13.0; python3 run_tests.py --output ./test --dir ./build/Samples --config test_args.json
| The "/tmp/cuda13.0" | directory | may | take | up a lot of diskspace. |
| ------------------- | --------- | --- | ---- | ---------------------- |

9.2VerifyingCUDA 93
Use "rm -rf /tmp/cuda13.0" to remove the data.
One of the binaries compiled is the device Query command. This can be run on anode accessing one
ormoreGPUs.The device Query command lists all CUDA-capable GPUs that a device can access,along
with several of their properties(someoutputelided). ItcanberuninCUDA13asfollows:
root@node001:/cm/shared/apps/cuda13.0/sdk/13.0.2# /tmp/cuda13.0/Samples/1_Utilities/deviceQuery/deviceQuery
/tmp/cuda13.0/Samples/1_Utilities/deviceQuery/deviceQuery Starting...
CUDA Device Query (Runtime API) version (CUDART static linking)
Detected 1 CUDA Capable device(s)
Device 0: "NVIDIA A100-PCIE-40GB"
CUDA Driver Version / Runtime Version 13.0 / 13.0
CUDA Capability Major/Minor version number: 8.0
Total amount of global memory: 40441 MBytes (42405855232 bytes)
(108) Multiprocessors, (064) CUDA Cores/MP: 6912 CUDA Cores
GPU Max Clock rate: 1410 MHz (1.41 GHz)
Memory Clock rate: 1215 Mhz
Memory Bus Width: 5120-bit
L2 Cache Size: 41943040 bytes
Maximum Texture Dimension Size (x,y,z) 1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
Maximum Layered 1D Texture Size, (num) layers 1D=(32768), 2048 layers
Maximum Layered 2D Texture Size, (num) layers 2D=(32768, 32768), 2048 layers
Total amount of constant memory: 65536 bytes
Total amount of shared memory per block: 49152 bytes
Total shared memory per multiprocessor: 167936 bytes
Total number of registers available per block: 65536
Warp size: 32
Maximum number of threads per multiprocessor: 2048
Maximum number of threads per block: 1024
Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
Max dimension size of a grid size (x,y,z): (2147483647, 65535, 65535)
Maximum memory pitch: 2147483647 bytes
Texture alignment: 512 bytes
Concurrent copy and kernel execution: Yes with 3 copy engine(s)
Run time limit on kernels: No
Integrated GPU sharing Host Memory: No
Support host page-locked memory mapping: Yes
Alignment requirement for Surfaces: Yes
Device has ECC support: Enabled
Device supports Unified Addressing (UVA): Yes
Device supports Managed Memory: Yes
Device supports Compute Preemption: Yes
Supports Cooperative Kernel Launch: Yes
Device PCI Domain ID / Bus ID / location ID: 0 / 0 / 6
Compute Mode:
< Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >
deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 13.0, CUDA Runtime Version = 13.0, NumDevs = 1
Result = PASS
root@node001:/cm/shared/apps/cuda13.0/sdk/13.0.2#
The query can detect if there is more than1GPU,and display output for each GPU that it finds.
The CUDA programming guide(https://docs.nvidia.com/cuda/cuda-programming-guide/)has
further information on how to run compute jobs using CUDA.

94 CUDAForGPUs
Further Information On CUDA Verification
More on verification can be found in the NVIDIA CUDA INSTALLATION GUIDE FOR LINUX at https:
//docs.nvidia.com/cuda/pdf/CUDA_Installation_Guide_Linux.pdf.
9.3 Verifying OpenCL
CUDA12.8contains an Open CL compatible interface. To verify that Open CL is working,orfailing,the
binaries can be compiled from the provided Open CL source and run. Forexample:
Example
root@node001:~# module load shared cuda12.8/toolkit
root@node001 ~# cd $CUDA_SDK
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1# cd opencl/OpenCL/ ; ls
bin common doc Makefile releaseNotesData Samples.html src
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL# make
a - obj/release/oclUtils.cpp.o
’ ’
make[1]: Leaving directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/common
’ ’
make[1]: Entering directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/shared
‘ ’ ‘ ’ ‘ ’
ar: u modifier ignored since D is the default (see U )
r - obj/x86_64/release/shrUtils.cpp.o
r - obj/x86_64/release/rendercheckGL.cpp.o
r - obj/x86_64/release/cmd_arg_reader.cpp.o
’ ’
make[1]: Leaving directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/shared
’ ’
make[1]: Entering directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/src/oclBandwidthTest
’ ’
make[1]: Leaving directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/src/oclBandwidthTest
...
The binaries made using the Make file can then be run from their directory:
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL# cd bin/linux/release/
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/bin/linux/release# ls
oclBandwidthTest
oclBandwidthTest.txt
oclBlackScholes
oclC on volution Separable
o cl Copy Compute Overlap
oclDCT8x8
oclDeviceQuery
oclDotProduct
oclDXTCompression
oclFDTD3d
o cl Hidden Markov Model
oclHistogram
oclInlinePTX
oclMatrixMul
oclMatVecMul
oclMersenneTwister
oclMultiThreads
o cl Quasi random Generator
oclRadixSort
oclReduction
oclScan
oclSimpleMultiGPU
oclSortingNetworks
oclTranspose

| 9.4NVIDIA Validation Suite(Package: |     |     | cuda-dcgm-nvvs) |     | 95  |
| --------------------------------- | --- | --- | --------------- | --- | --- |
oclTridiagonal
oclVectorAdd
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/bin/linux/release# for i in ocl*; do ./$i ; done
| [oclBandwidthTest] | starting... |     |     |     |     |
| ------------------ | ----------- | --- | --- | --- | --- |
| ./oclBandwidthTest | Starting... |     |     |     |     |
Running on...
Tesla V100-SXM3-32GB
Quick Mode
| Host to Device     | Bandwidth,        | 1          | Device(s), Paged | memory, direct access |     |
| ------------------ | ----------------- | ---------- | ---------------- | --------------------- | --- |
| Transfer           | Size (Bytes)      |            | Bandwidth(MB/s)  |                       |     |
| 33554432           |                   |            | 5528.1           |                       |     |
| Device to          | Host Bandwidth,   | 1          | Device(s), Paged | memory, direct access |     |
| Transfer           | Size (Bytes)      |            | Bandwidth(MB/s)  |                       |     |
| 33554432           |                   |            | 3915.9           |                       |     |
| Device to          | Device Bandwidth, |            | 1 Device(s)      |                       |     |
| Transfer           | Size (Bytes)      |            | Bandwidth(MB/s)  |                       |     |
| 33554432           |                   |            | 724307.1         |                       |     |
| [oclBandwidthTest] | test              | results... |                  |                       |     |
PASSED
| > exiting   | in 3 seconds:                                  | 3...2...1...done! |                 |                 |     |
| ----------- | ---------------------------------------------- | ----------------- | --------------- | --------------- | --- |
| ...Andsoon. | The other binaries listed should also run and pass.... |                   |                 |                 |     |
| 9.4 NVIDIA  | Validation                                     |                   | Suite (Package: | cuda-dcgm-nvvs) |     |
The NVIDIA Validation Suite (NVVS) runs diagnostics to validate the NVIDIA software components.
Running the nv vs binary directly is deprecated. The diagnostics for CUDA12.8areruninsteadaspart
| ofthedcgmi | diagcommand. |     |     |     |     |
| ---------- | ------------ | --- | --- | --- | --- |
The package for NV VS is not installed by default. It is also not available for RHEL8andderivatives.
If the package is not installed,then an attempt to run the dc gm i utility fails:
Example
| [root@basecm11 | ~] module | load | cuda-dcgm |     |     |
| -------------- | --------- | ---- | --------- | --- | --- |
| [root@basecm11 | ~]# dcgmi | diag | -r 1      |     |     |
Error: Diagnostic could not be run because the Tesla recommended driver is not being used.
The package can be installed with:
Example
| [root@basecm11 | ~] module | load    | cuda-dcgm      |     |     |
| -------------- | --------- | ------- | -------------- | --- | --- |
| [root@basecm11 | ~] yum    | install | cuda-dcgm-nvvs |     |     |
Afteritisinstalled,the node on which the installation is done must be re booted.
Running the diagnostic after the reboot should display output similar to:
Example

| 96             |                |                |     | CUDAForGPUs |
| -------------- | -------------- | -------------- | --- | ----------- |
| [root@basecm11 | ~] module      | load cuda-dcgm |     |             |
| [root@basecm11 | ~]# dcgmi      | diag -r 3      |     |             |
| Successfully   | ran diagnostic | for group.     |     |             |
+---------------------------+------------------------------------------------+
| | Diagnostic |     | | Result |     | |   |
| ------------ | --- | -------- | --- | --- |
+===========================+================================================+
|----- Metadata ----------+------------------------------------------------|
| | DCGM Version |                  | | 4.1.1       |            | |   |
| -------------- | ---------------- | ------------- | ---------- | --- |
| | Driver       | Version Detected | | 570.82      |            | |   |
| | GPU Device   | IDs Detected     | | 2941, 2941, | 2941, 2941 | |   |
| | Number       | of CPUs Detected | | 2           |            | |   |
|----- Deployment --------+------------------------------------------------|
| | software |     | | Pass       |     | |   |
| ---------- | --- | ------------ | --- | --- |
| |          |     | | GPU0: Pass |     | |   |
| |          |     | | GPU1: Pass |     | |   |
| |          |     | | GPU2: Pass |     | |   |
| |          |     | | GPU3: Pass |     | |   |
+----- Hardware ----------+------------------------------------------------+
| | memory      |     | | Skip       |     | |   |
| ------------- | --- | ------------ | --- | --- |
| |             |     | | GPU0: Skip |     | |   |
| |             |     | | GPU1: Skip |     | |   |
| |             |     | | GPU2: Skip |     | |   |
| |             |     | | GPU3: Skip |     | |   |
| | diagnostic  |     | | Skip       |     | |   |
| |             |     | | GPU0: Skip |     | |   |
| |             |     | | GPU1: Skip |     | |   |
| |             |     | | GPU2: Skip |     | |   |
| |             |     | | GPU3: Skip |     | |   |
| | nvbandwidth |     | | Skip       |     | |   |
| |             |     | | GPU0: Skip |     | |   |
| |             |     | | GPU1: Skip |     | |   |
| |             |     | | GPU2: Skip |     | |   |
| |             |     | | GPU3: Skip |     | |   |
+----- Integration -------+------------------------------------------------+
| | pcie |     | | Skip       |     | |   |
| ------ | --- | ------------ | --- | --- |
| |      |     | | GPU0: Skip |     | |   |
| |      |     | | GPU1: Skip |     | |   |
| |      |     | | GPU2: Skip |     | |   |
| |      |     | | GPU3: Skip |     | |   |
+----- Stress ------------+------------------------------------------------+
| | memory_bandwidth |     | | Skip       |     | |   |
| ------------------ | --- | ------------ | --- | --- |
| |                  |     | | GPU0: Skip |     | |   |
| |                  |     | | GPU1: Skip |     | |   |
| |                  |     | | GPU2: Skip |     | |   |
| |                  |     | | GPU3: Skip |     | |   |
| | targeted_stress  |     | | Skip       |     | |   |
| |                  |     | | GPU0: Skip |     | |   |
| |                  |     | | GPU1: Skip |     | |   |
| |                  |     | | GPU2: Skip |     | |   |
| |                  |     | | GPU3: Skip |     | |   |
| | targeted_power   |     | | Skip       |     | |   |
| |                  |     | | GPU0: Skip |     | |   |
| |                  |     | | GPU1: Skip |     | |   |
| |                  |     | | GPU2: Skip |     | |   |
| |                  |     | | GPU3: Skip |     | |   |

9.5Further NVIDIA Configuration Via The Cluster Manager 97
+---------------------------+------------------------------------------------+
9.5 Further NVIDIA Configuration Via The Cluster Manager
After theinstallation andverification hasbeen carriedout for CUDAdrivers, further configuration as
part of CM Daemon management can be carried out, as explained in section3.16.2oftheAdministrator
Manual.

10
OFED Software Stack
This section explains how OFED (OpenFabrics Enterprise Distribution) packages are installed so that
BC M can use In fin i Band for data transfer during regular use—that is for computation runs,ratherthan
for booting up or provisioning. The configuration of PXE booting over InfiniBand is described in sec-
tion 5.1.3 of the Administrator Manual. The configuration of node provisioning over InfiniBand is de-
scribedinsection5.3.3of the Administrator Manual.
10.1 Choosing A Distribution Version, Or A Non-distribution Version,
Ensuring The Kernel Matches, And Logging The Installation
By default, the Linux distribution OFED stack is matched to the kernel version and installed on the
cluster. This is the safest option in most cases,and also allows NFS over RD MA.
BCM also allows NVIDIA’s Mellanox OFED (sometimes called MOFED) software to be installed.
Such separate, non-distribution OFED stacks can be more recent than the distribution version, which
means that they can provide support for more recent hardware and firmware,as well as more features.
For recent OFED stacks to work, the OFED firmware as provided by the manufacturer should in
generalalsoberecent,to ensure software driver compatibility.
If NVIDIA AI Enterprise is to be used, then a matching, supported, version of OFED must be se-
lected. A matching, supported OFED version can be found by contacting support via the BCM sub-
script ion at the NVIDIA Enterprise Support page at:
https://www.nvidia.com/en-us/support/enterprise/
Since June 2025, BCM no longer supports the non-distribution legacy BCM-packaged Mellanox
OFED stack. These were packages that were provided from the BCM repository, with names such as
mlnx-ofed58,mlnx-ofed59-dgx-h100,mlnx-ofed59,mlnx-ofed23.04,andmlnx-ofed24.07.
BCM has moved on to installing the non-distribution NVIDIA DOCA OFED stack directly (sec-
tion10.2),with the help of an installation script. The upstream NVIDIA DOC A OF ED stack is a subset
of the full DOC A software stack.
If there is no DOCA OFED stack available for the kernel in use, then falling back to a supported
kernelisrecommended.
When updating kernels on the head or the regular nodes,the updated NVIDIA DOC A OF ED soft-
ware stack must be reinstalled.
10.2 DOCA OFED Stack Installation Using The BCM DOCA OFED Installation
Script
The DOC A versions available at the time of writing,April2026,are: 2.9.3,3.2.1
ForDOCAOFEDdrivers,installation can be carried out for BC M with these methods:
• during the initial cluster installation(figure3.23)

100 OFEDSoftwareStack
• on a running cluster by running the BCM DOCA installation script, which comes with the BCM
cluster-toolspackage. This method is covered in this section.
• on a running cluster by creating an new image for nodes using the cm-create-imageorcm-image
toolswiththe--extra-pkg-groupoption. This method is covered in page542oftheAdministrator
Manual.
The installation script is located at:
root@basecm11:~# /cm/local/apps/cluster-tools/bin/cm-doca-ofed-install.sh
Running the script without any arguments show sausage help text.
The following arguments must be specified:
• -v|--version: This chooses which DOCA version is to be used. At the time of writing of this
section(April2026)theseare:
– 2.9.3
– 3.2.1
• -hor-s: these select if the DOC A installation is carried out on the head or software image
Example
/cm/local/apps/cluster-tools/bin/cm-doca-ofed-install.sh -v 3.2.1 -h
The installation log is recorded in:
/var/log/cm-doca-ofed.log
while the version installed is recorded in
/etc/cm-ofed

11
Burning Nodes
The burn framework is a component of NVIDIA Base Command Manager11that can automatically run
test scripts on specified nodes within a cluster. The framework is designed to stress test newly built
machines and to detect components that may fail under load. Nodes undergoing a burn session with
the default burn configuration,lose their filesystem and partition data for all attached drives,andrevert
to their software image on provisioning after are boot.
11.1 Test Scripts Deployment
The framework requires power management to be running and working properly so that the node can
be power cycled by the scripts used. In modern clusters power management is typically achieved by
enabling a baseboard management controller such as IP MI,iLO,orRedfish. Details on power manage-
ment are given in Chapter4of the Administrator Manual.
The framework can run any executable script. The default test scripts are mostly bash
shell scripts and Perl scripts. Each test script has a directory in /cm/shared/apps/cmburn con-
taining the script. The directory and test script must have the same name. For example:
/cm/shared/apps/cmburn/disktest/disktest is the default script used for testing a disk. More on
the contents of a test script is given in section11.3.2.
11.2 Burn Configurations
11.2.1 Burn Configuration Simple XML Example
A burn configuration is an XML file stored in the CM Daemon database that specifies the burn tests and the
orderinwhichtheyrun. Within the burn configuration the tests are normally grouped into sequences,
and several sequences typically make up a phase. Phases in turn are grouped in either a pre-install
sectionorpost-installsection. A simple example of such a burn configuration could therefore look like:
Example
<?xml version="1.0"?>
<burnconfig>
<mail>
<address>root@master</address>
<address>some@other.address</address>
</mail>
<pre-install>
<phase name="01-hwinfo">
<test name="hwinfo"/>

102 BurningNodes
<test name="hwdiff"/>
<test name="sleep" args="10"/>
</phase>
<phase name="02-disks">
<test name="disktest" args="30"/>
<test name="mce_check" endless="1"/>
</phase>
</pre-install>
<post-install>
<phase name="03-hpl">
<test name="hpl"/>
<test name="mce_check" endless="1"/>
</phase>
<phase name="04-compile">
<test name="compile" args="6"/>
<test name="mce_check" endless="1"/>
</phase>
</post-install>
</burnconfig>
MailTag
The optional <mail> tag pair can add a sequence of e-mail addresses, with each address enclosed in
an<address>tagpair. These addresses receive burn failure and warning messages,aswellasanotice
when the burn run has completed.
Pre-installAndPost-install
Thepre-install part of a burn configuration is configured with the<pre-install>tagpair,andrunfrom
insideanode-installer environment. This environment is a limited Linux environment and allows some
simpler tests to run before loading up the full Linux node environment.
Similarly,thepost-install part of a burn configuration uses the<post-install>tagpairtorunfrom
inside the full Linux node environment. This environment allows more complex tests to run.
Post-burnInstallMode
The optional <post-burn-install> tag pair allows the administrator to specify the install mode (sec-
tion 5.4.4 of the Administrator Manual) after burn. The tag pair can enclose a setting of AUTO, FULL,
MAIN,orNOSYNC.The default setting is the install mode that was set before burn started.
Phases
The phases sections must exist.If there is no content for the phases,the phases tags must still be in place
(“mustexist”). Each phase must have a unique name and must be written in the burn configuration file
in alpha numerical order.Bydefault,numbers are used as prefixes.The phases are executed in sequence.
Tests
Each phase consists of one or more test tags.The tests can optionally be passed arguments using the arg s
property of the burn configuration file(section11.2). If multiple arguments are required,theyshouldbe
aspaceseparatedlist,withthe(single)list being the arg s property.
Tests in the same phase are run simultaneously.

11.3Running A Burn Configuration 103
Most tests test something and then end. Forexample,the disk test tests the performance of all drives
andthenquits.
Tests which are designed to end automatically are known as non-endlesstests.
Tests designed to monitor continuously are known as endless tests.Endless tests are not really endless.
They end once all the non-endless tests in the same phase are ended,thus bringing an end to the phase.
Endless tests typically test for errors caused by the load induced by the non-endlesstests. Forexample
themce_check test continuously keeps an eye out for Machine Check Exceptions while the non-endless
tests in the same phase are run.
A special testis the final test,memtest86,which is part of the default burn run,asconfiguredinthe
XML configuration default-destructive. It does run endlessly if left to run. To end it, the adminis-
tr at or can deal with its output at the node console or can power reset the node. It is usually convenient
toremovememtest86from the default XML configuration in larger clusters,and to rely on the HP Land
mem tester tests instead,for uncovering memory hardware errors.
11.2.2 Burn Configuration XML Schema Definition
InBCM,burn configuration setups such as in section11.2.1have their global structure defined using an
XMLschemadefinition,which is installed on the head node in/cm/local/apps/cmd/etc/htdocs/xsd/
burnconfig.xsd.
The XML schema definition can also be viewed with:
Example
| [root@basecm11 | ]#  | cmsh -c "main        | xsdschema | burnconfig" | | less |
| -------------- | --- | -------------------- | --------- | ----------- | ------ |
| 11.3 Running   |     | A Burn Configuration |           |             |        |
Burn configurations can be viewed and executed from cm sh.
11.3.1 Burn Configuration And Execution In cm sh
Burn Configuration File Settings
Fromcmsh,the burn configurations can be accessed from partition mode as follows:
Example
| [basecm11]%                               | partition | use base                 |            |               |        |
| ----------------------------------------- | --------- | ------------------------ | ---------- | ------------- | ------ |
| [basecm11->partition[base]]%              |           | burnconfigs              |            |               |        |
| [basecm11->partition[base]->burnconfigs]% |           |                          |            | list          |        |
| Name (key)                                |           | Description              |            | XML           |        |
| -------------------                       |           | ------------------------ |            | ------------- |        |
| default-destructive                       |           | Standard                 | burn test. | <2614         | bytes> |
| long-hpl                                  |           | Run HPL test             | for        | a long+ <829  | bytes> |
The values of a particular burn configuration(default-destructive in the following example)can
beviewedasfollows:
Example
| [basecm11->partition[base]->burnconfigs]% |     |     |     | use default-destructive |     |
| ----------------------------------------- | --- | --- | --- | ----------------------- | --- |
[basecm11->partition[base]->burnconfigs[default-destructive]]% show
| Parameter |     | Value |     |     |     |
| --------- | --- | ----- | --- | --- | --- |
---------------------- --------------------------------------------------------
Description Standard destructive burn test. Beware, wipes the disks!
| Name |     | default-destructive |     |     |     |
| ---- | --- | ------------------- | --- | --- | --- |
Revision
| XML |     | <2614 bytes> |     |     |     |
| --- | --- | ------------ | --- | --- | --- |

104 BurningNodes
The set command can be used to modify existing values of the burn configuration, that is:
Description, Name, and XML. XML is the burn configuration file itself. The get xml command can be
used to view the file, while using set xml opens up the default text editor, thus allowing the burn
configuration to be modified.
A new burn configuration can also be added with the add command. The new burn configuration
can be created from scratch with the set command. However,an XML file can also be imported to the
new burn configuration by specifying the full path of the XML file to be imported:
Example
| [basecm11->partition[base]->burnconfigs]% |     |     | add | boxburn |     |
| ----------------------------------------- | --- | --- | --- | ------- | --- |
[basecm11->partition[base]->burnconfigs*[boxburn*]]% set xml /tmp/im.xml
The burn configuration can also be edited when carrying out burn execution with the burn com-
mand.
ExecutingABurn
A burn as specified by the burn configuration file can be executed in cm sh using the burn command of
devicemode.
Burn commands: The burn commands can modify these properties, as well as execute other burn-
relatedoperations.
The burn commands are executed within device mode,andare:
| • burn | start  |     |     |     |     |
| ------ | ------ | --- | --- | --- | --- |
| • burn | stop   |     |     |     |     |
| • burn | status |     |     |     |     |
| • burn | log    |     |     |     |     |
The burn help text that follows lists the detailed options. Next,operations with the burn commands
illustrate how the options maybe used along with some features.
| [head1->device[node005]]% |                | burn        |                                           |     |     |
| ------------------------- | -------------- | ----------- | ----------------------------------------- | --- | --- |
| Name: burn                | - Node burn    | control     |                                           |     |     |
| Usage: burn               | [OPTIONS]      | status      |                                           |     |     |
| burn                      | [OPTIONS]      | start       |                                           |     |     |
| burn                      | [OPTIONS]      | stop        |                                           |     |     |
| burn                      | [OPTIONS]      | log         |                                           |     |     |
| Options: -n,              | --nodes <node> |             |                                           |     |     |
|                           | List of        | nodes, e.g. | node001..node015,node020..node028,node030 |     |     |
or ^/some/file/containing/hostnames
-g, --group <group>
Include all nodes that belong to the node group, e.g. testnodes or test01,test03
| -c, | --category | <category> |     |     |     |
| --- | ---------- | ---------- | --- | --- | --- |
Include all nodes that belong to the category, e.g. default or default,gpu
-r, --rack <rack>
|     | Include | all nodes that | are located | in the given | rack, e.g rack01 |
| --- | ------- | -------------- | ----------- | ------------ | ---------------- |
or rack01..rack04

11.3Running A Burn Configuration 105
| -h, --chassis | <chassis> |     |     |     |     |     |     |     |
| ------------- | --------- | --- | --- | --- | --- | --- | --- | --- |
Include all nodes that are located in the given chassis, e.g chassis01
or chassis03..chassis05
| -e, --overlay | <overlay> |      |     |      |              |          |              |     |
| ------------- | --------- | ---- | --- | ---- | ------------ | -------- | ------------ | --- |
| Include       | all nodes | that | are | part | of the given | overlay, | e.g overlay1 |     |
or overlayA,overlayC
-m, --image <image>
| Include | all nodes | that | have | the | given image, | e.g | default-image | or  |
| ------- | --------- | ---- | ---- | --- | ------------ | --- | ------------- | --- |
default-image,gpu-image
-t, --type <type>
| Type of | devices, | e.g | node | or virtualnode,cloudnode |     |     |     |     |
| ------- | -------- | --- | ---- | ------------------------ | --- | --- | --- | --- |
-i, --intersection
| Calculate | the | intersection |     | of the | above | selections |     |     |
| --------- | --- | ------------ | --- | ------ | ----- | ---------- | --- | --- |
-u, --union
| Calculate | the | union | of the | above | selections |     |     |     |
| --------- | --- | ----- | ------ | ----- | ---------- | --- | --- | --- |
-l, --role role
| Filter | all nodes | that | have | the | given role |     |     |     |
| ------ | --------- | ---- | ---- | --- | ---------- | --- | --- | --- |
-s, --status <status>
Only run command on nodes with specified status, e.g. UP, "CLOSED|DOWN",
"INST.*"
--config <name>
Burn with the specified burn configuration. See in partition burn configurations
| for a list | of  | valid | names |     |     |     |     |     |
| ---------- | --- | ----- | ----- | --- | --- | --- | --- | --- |
--file <path>
| Burn with | the | specified | file | instead | of  | burn configuration |     |     |
| --------- | --- | --------- | ---- | ------- | --- | ------------------ | --- | --- |
--later
| Do not | reboot | nodes | now, | wait until | manual | reboot |     |     |
| ------ | ------ | ----- | ---- | ---------- | ------ | ------ | --- | --- |
--edit
| Open editor | for | last | minute | changes |     |     |     |     |
| ----------- | --- | ---- | ------ | ------- | --- | --- | --- | --- |
--no-drain
| Do not | drain | the node | from | WLM | before starting |     | to burn |     |
| ------ | ----- | -------- | ---- | --- | --------------- | --- | ------- | --- |
--no-undrain
| Do not | undrain | the | node from | WLM | after burn | is  | complete |     |
| ------ | ------- | --- | --------- | --- | ---------- | --- | -------- | --- |
-p, --path
| Show path | to  | the burn | log | files. | Of the | form: | /var/spool/burn/<mac>. |     |
| --------- | --- | -------- | --- | ------ | ------ | ----- | ---------------------- | --- |
-v, --verbose
| Show verbose |     | output | (only | for burn | status) |     |     |     |
| ------------ | --- | ------ | ----- | -------- | ------- | --- | --- | --- |
--sort <field1>[,<field2>,...]

106 BurningNodes
| Override        |           | default  | sort      | order | (only for | burn status) |
| --------------- | --------- | -------- | --------- | ----- | --------- | ------------ |
| -d, --delimiter |           | <string> |           |       |           |              |
| Set             | default   | row      | separator | (only | for       | burn status) |
| -d, --delay     | <seconds> |          |           |       |           |              |
Wait <seconds> between executing two sequential power commands. This option is
| ignored |     | for the | status | command |     |     |
| ------- | --- | ------- | ------ | ------- | --- | --- |
Examples:
| burn --config |     | default-destructive |     |     | start -n | node001 |
| ------------- | --- | ------------------- | --- | --- | -------- | ------- |
Burn command operations: Burn commands allow the following operations,andhavethefollowing
features:
• start,stop,status,log:The basic burn operations allow a burn to be started or stopped,andthe
status of a burn to be viewed and logged.
– The “burn start” command always needs a configuration file name. In the following it is
boxburn. The command also always needs to be given the nodes it operates on:
| [basecm11->device]% |       |     | burn --config |     | boxburn | -n node007 start |
| ------------------- | ----- | --- | ------------- | --- | ------- | ---------------- |
| Power reset         | nodes |     |               |     |         |                  |
[basecm11->device]%
| ipmi0 .................... |       |          |           | [ RESET | ] node007 |          |
| -------------------------- | ----- | -------- | --------- | ------- | --------- | -------- |
| Fri Nov                    | 3 ... | [notice] | basecm11: |         | node007   | [ DOWN ] |
[basecm11->device]%
Fri Nov 3 ... [notice] basecm11: node007 [ INSTALLING ] (node installer started)
[basecm11->device]%
Fri Nov 3 ... [notice] basecm11: node007 [ INSTALLING ] (running burn in tests)
...
– The“burn stop”command only needs to be given the nodes it operates on,forexample:
| [basecm11->device]% |                 |     | burn -n | node007 | stop |     |
| ------------------- | --------------- | --- | ------- | ------- | ---- | --- |
| – The“burn          | status”command: |     |         |         |      |     |
* maybe given the nodes for which the status is to be found,forexample:

| 11.3Running A Burn Configuration |     |                     |             |        |                     |          |              | 107 |
| ----------------------------- | --- | ------------------- | ----------- | ------ | ------------------- | -------- | ------------ | --- |
|                               |     | [basecm11->device]% | burn        | status | -n node005..node007 |          |              |     |
|                               |     | Hostname Burn       | name Status |        |                     | New burn | on PXE Phase | ... |
-------- --------- ------------------------- --------------- -------- ...
|     |     | node005         | no        | burn results | available | no  |          | ... |
| --- | --- | --------------- | --------- | ------------ | --------- | --- | -------- | --- |
|     |     | node006         | currently | not          | burning   | no  |          | ... |
|     |     | node007 boxburn | Burning   |              |           | yes | 02-disks | ... |
each line of output is quite long,so each line has been rendered truncated andel lip sized.
The ellipsis marks in the5preceding output lines align with the lines that follow.
Thatis,the lines that follow are the endings of the preceding5lines:
|     |     | ...Warnings | Tests |     |     |     |     |     |
| --- | --- | ----------- | ----- | --- | --- | --- | --- | --- |
...--------- --------------------------------------------------------------
...0
...0
...0 /var/spool/burn/c8-1f-66-f2-61-c0/02-disks/disktest (S,171),\
|     |     |     | /var/spool/burn/c8-1f-66-f2-61-c0/02-disks/kmon |     |     |     | (S),\ |     |
| --- | --- | --- | ----------------------------------------------- | --- | --- | --- | ----- | --- |
/var/spool/bu+
– The “burn log” command displays the burn log for specified node groupings. Each node
with a boot MAC address of<mac>has an associated burn log file.
• Advanced options include the following:
– -n|--nodes, -g|--group, -c|--category, -r|--rack, -h|--chassis, -e|--overlay,
-t|--type,-i|--intersection,-u|--union,-r|--role,-s|--status: Theseoptionsallow
burn commands to be executed over various node groupings.
– --config <burn configuration>, --file <path>: The burn configuration file can be set as one
of the XML burn configurations listed in partition mode,or it can be set as the path of the
XML file from the filesystem
– -l|--later:This option disables the immediate power reset that occurs on running the“burn
start”or“burn stop”commandonanode. This allows the administrator to power down
manually,whenpreferred.
– -e|--edit:The burn configuration file can be edited with the-eoptionforthe“burn start”
command. This is an alternative to editing the burn configuration file in partition mode.
– --no-drain,--no-undrain: The node is not drained before burning,ornotundrainedafter
burning
-p|--path:
– This shows the burn log path,bydefault(section11.4)ontheheadnodeundera
directory named after the mac address/var/spool/burn/<mac>.
Example
|     | [basecm11->device]% |                                   | burn -p | -n node001..node003 |     | log |     |     |
| --- | ------------------- | --------------------------------- | ------- | ------------------- | --- | --- | --- | --- |
|     | node001:            | /var/spool/burn/fa-16-3e-60-1d-c7 |         |                     |     |     |     |     |
|     | node002:            | /var/spool/burn/fa-16-3e-8a-d8-0e |         |                     |     |     |     |     |
|     | node003:            | /var/spool/burn/fa-16-3e-af-38-cd |         |                     |     |     |     |     |
Burn command output examples: The burn status command has a compact one-line output per
node:
Example
| [basecm11->device]% |     | burn -n | node001 status |     |     |     |     |     |
| ------------------- | --- | ------- | -------------- | --- | --- | --- | --- | --- |
node001 (00000000a000) - W(0) phase 02-disks 00:02:58 (D:H:M) FAILED, mce_check (SP),\
| disktest | (SF,61), | kmon (SP) |     |     |     |     |     |     |
| -------- | -------- | --------- | --- | --- | --- | --- | --- | --- |

108 BurningNodes
The fields in the preceding output example are:
| Description              |     | Value          |     |     | MeaningHere |     |
| ------------------------ | --- | -------------- | --- | --- | ----------- | --- |
| Thenodename              |     | node001        |     |     |             |     |
| Thenodetag               |     | (00000000a000) |     |     |             |     |
| Warnings since start of burn |     | (0)            |     |     |             |     |
02-disks
| Thecurrentphasename |     |     |     |     | Burn configuration phase being |     |
| ------------------- | --- | --- | --- | --- | --------------------------- | --- |
runis02-disks
| Time since phase started |     | 00:02:58  |     | (D:H:M) | 2hours58minutes  |     |
| --------------------- | --- | --------- | --- | ------- | ---------------- | --- |
| Stateofcurrentphase   |     | FAILED    |     |         | Failedin02-disks |     |
| burntestforMCE        |     | mce_check |     | (SP)    | StartedandPassed |     |
| burntestfordisks      |     | disktest  |     | (SF,61) | StartedandFailed |     |
61isthespeed,andiscustom
information
| burn test kernel log monitor |     | kmon | (SP) |     | StartedandPassed |     |
| ------------------------ | --- | ---- | ---- | --- | ---------------- | --- |
Each test in a phase uses these letters to display its status:
| Letter | Meaning |     |     |     |     |     |
| ------ | ------- | --- | --- | --- | --- | --- |
| S      | started |     |     |     |     |     |
| W      | warning |     |     |     |     |     |
| F      | failed  |     |     |     |     |     |
| P      | passed  |     |     |     |     |     |
The“burn log”command output looks like the following(someoutputelided):
| [basecm11->device]% | burn -n                 | node001 | log  |           |              |     |
| ------------------- | ----------------------- | ------- | ---- | --------- | ------------ | --- |
| Thu ... 2012:       | node001 - burn-control: |         | burn | framework | initializing |     |
Thu ... 2012: node001 - burn-control: e-mail will be sent to: root@master
| Thu ... 2012: | node001 - burn-control: |     | finding  | next | pre-install     | phase |
| ------------- | ----------------------- | --- | -------- | ---- | --------------- | ----- |
| Thu ... 2012: | node001 - burn-control: |     | starting |      | phase 01-hwinfo |       |
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/hwinfo
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/sleep
| Thu ... 2012: | node001 - sleep:  | sleeping | for       | 10          | seconds        |     |
| ------------- | ----------------- | -------- | --------- | ----------- | -------------- | --- |
| Thu ... 2012: | node001 - hwinfo: | hardware |           | information |                |     |
| Thu ... 2012: | node001 - hwinfo: | CPU1:    | vendor_id |             | = AuthenticAMD |     |
...
Thu ... 2012: node001 - burn-control: test hwinfo has ended, test passed
Thu ... 2012: node001 - burn-control: test sleep has ended, test passed
Thu ... 2012: node001 - burn-control: all non-endless test are done, terminating endless tests
| Thu ... 2012: | node001 - burn-control: |     | phase   | 01-hwinfo | passed      |       |
| ------------- | ----------------------- | --- | ------- | --------- | ----------- | ----- |
| Thu ... 2012: | node001 - burn-control: |     | finding | next      | pre-install | phase |

11.3Running A Burn Configuration 109
| Thu ... 2012: | node001 - burn-control: |     | starting | phase | 02-disks |     |
| ------------- | ----------------------- | --- | -------- | ----- | -------- | --- |
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/disktest
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/mce_check
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/kmon
| Thu ... 2012: | node001 - disktest: |     | starting, | threshold | =   | 30 MB/s |
| ------------- | ------------------- | --- | --------- | --------- | --- | ------- |
’
| Thu ... 2012: | node001 - mce_check: |        | checking | for MCE   | s every | minute |
| ------------- | -------------------- | ------ | -------- | --------- | ------- | ------ |
| Thu ... 2012: | node001 - kmon:      | kernel | log      | monitor   | started |        |
| Thu ... 2012: | node001 - disktest:  |        | detected | 1 drives: | sda     |        |
...
| Thu ... 2012: | node001 - disktest: |     | drive sda | wrote | 81920 | MB in 1278.13 |
| ------------- | ------------------- | --- | --------- | ----- | ----- | ------------- |
Thu ... 2012: node001 - disktest: speed for drive sda was 64 MB/s -> disk passed
Thu ... 2012: node001 - burn-control: test disktest has ended, test FAILED
Thu ... 2012: node001 - burn-control: all non-endless test are done, terminating endless tests
Thu ... 2012: node001 - burn-control: asking test /cm/shared/apps/cmburn/kmon/kmon to terminate
| Thu ... 2012: | node001 - kmon: | kernel | log | monitor | terminated |     |
| ------------- | --------------- | ------ | --- | ------- | ---------- | --- |
Thu ... 2012: node001 - burn-control: test kmon has ended, test passed
Thu ... 2012: node001 - burn-control: asking test /cm/shared/apps/cmburn/mce_check/mce_check\
to terminate
| Thu ... 2012: | node001 - mce_check: |     | terminating |               |     |         |
| ------------- | -------------------- | --- | ----------- | ------------- | --- | ------- |
| Thu ... 2012: | node001 - mce_check: |     | waiting     | for mce_check |     | to stop |
’
| Thu ... 2012: | node001 - mce_check: |     | no MCE     | s found |     |     |
| ------------- | -------------------- | --- | ---------- | ------- | --- | --- |
| Thu ... 2012: | node001 - mce_check: |     | terminated |         |     |     |
Thu ... 2012: node001 - burn-control: test mce_check has ended, test passed
| Thu ... 2012: | node001 - burn-control: |     | phase | 02-disks       | FAILED |     |
| ------------- | ----------------------- | --- | ----- | -------------- | ------ | --- |
| Thu ... 2012: | node001 - burn-control: |     | burn  | will terminate |        |     |
Theoutputoftheburn log command is actually the messages file in the burn directory,forthenode
associated with a MAC-address directory <mac>. The burn directory is at /var/spool/burn/ and the
messages file is thus located at:
/var/spool/burn/<mac>/messages
The tests have their log files in their own directories under the MAC-addressdirectory, usingtheir
Forexample,thepre-install section has a phase named01-hwinfo.
phasename. Theoutputlogsofthis
test are then stored under:
/var/spool/burn/<mac>/01-hwinfo/
11.3.2 WritingATestScript
This section describes a sample test script for use within the burn framework. The script is typically a
shellorPerlscript. The sample that follows is aBash script,while the hp l script is an example in Perl.
Section11.1describe show to deploy the script.
Non-endlessTests
The following example test script is not a working test script,but can be used as a template for an on-
endlesstest:
Example
#!/bin/bash
# We need to know our own test name, amongst other things for logging.
| ‘            | ‘   |     |     |     |     |     |
| ------------ | --- | --- | --- | --- | --- | --- |
| me= basename | $0  |     |     |     |     |     |

110 BurningNodes
# This first argument passed to a test script by the burn framework is a
# path to a spool directory. The directory is created by the framework.
# Inside the spool directory a sub-directory with the same name as the
# test is also created. This directory ($spooldir/$me) should be used
# for any output files etc. Note that the script should possibly remove
# any previous output files before starting.
spooldir=$1
# In case of success, the script should touch $passedfile before exiting.
passedfile=$spooldir/$me.passed
# In case of failure, the script should touch $failedfile before exiting.
# Note that the framework will create this file if a script exits without
# creating $passedfile. The file should contain a summary of the failure.
failedfile=$spooldir/$me.failed
# In case a test detects trouble but does not want the entire burn to be
# halted $warningfile _and_ $passedfile should be created. Any warnings
# should be written to this file.
warningfile=$spooldir/$me.warning
# Some short status info can be written to this file. For instance, the
# stresscpu test outputs something like 13/60 to this file to indicate
# time remaining.
# Keep the content on one line and as short as possible!
statusfile=$spooldir/$me.status
# A test script can be passed arguments from the burn configuration. It
# is recommended to supply default values and test if any values have
# been overridden from the config file. Set some defaults:
option1=40
option2=some_other_value
# Test if option1 and/or option2 was specified (note that $1 was to
# spooldir parameter):
if [ ! x$2 = "x" ]; then
option1=$2
fi
if [ ! x$3 = "x" ]; then
option2=$3
fi
# Some scripts may require some cleanup. For instance a test might fail
# and be
# restarted after hardware fixes.
rm -f $spooldir/$me/*.out &>/dev/null
# Send a message to the burn log file, syslog and the screen.
# Always prefix with $me!
blog "$me: starting, option1 = $option1 option2 = $option2"
# Run your test here:
run-my-test
if [ its_all_good ]; then
’
blog "$me: wOOt, it s all good! my-test passed."

11.3Running A Burn Configuration 111
touch $passedfile
exit 0
| elif [ | was_a_problem | ];  | then |     |     |     |     |
| ------ | ------------- | --- | ---- | --- | --- | --- | --- |
’
blog "$me: WARNING, it did not make sense to run this test. You don t have special device X."
| echo | "some warning" | >>  | $warningfile |     | # note | the append! |     |
| ---- | -------------- | --- | ------------ | --- | ------ | ----------- | --- |
touch $passedfile
exit 0
else
’
| blog | "$me: Aiii,        | we re | all gonna     | die! | my-test | FAILED!" |     |
| ---- | ------------------ | ----- | ------------- | ---- | ------- | -------- | --- |
| echo | "Failure message." |       | > $failedfile |      |         |          |     |
exit 0
fi
EndlessTests
The following example test script is not a working test,but can be used as a template for an endless test.
Example
#!/bin/bash
# We need to know our own test name, amongst other things for logging.
| ‘            | ‘   |     |     |     |     |     |     |
| ------------ | --- | --- | --- | --- | --- | --- | --- |
| me= basename | $0  |     |     |     |     |     |     |
# This first argument passed to a test script by the burn framework is a
# path to a spool directory. The directory is created by the framework.
# Inside the spool directory a sub-directory with the same name as the
| # test | is also created. |     | This directory |     | ($spooldir/$me) |     | should be used |
| ------ | ---------------- | --- | -------------- | --- | --------------- | --- | -------------- |
# for any output files etc. Note that the script should possibly remove
| # any previous | output | files | before | starting. |     |     |     |
| -------------- | ------ | ----- | ------ | --------- | --- | --- | --- |
spooldir=$1
# In case of success, the script should touch $passedfile before exiting.
passedfile=$spooldir/$me.passed
# In case of failure, the script should touch $failedfile before exiting.
# Note that the framework will create this file if a script exits without
# creating $passedfile. The file should contain a summary of the failure.
failedfile=$spooldir/$me.failed
# In case a test detects trouble but does not want the entire burn to be
# halted $warningfile _and_ $passedfile should be created. Any warnings
| # should | be written | to this | file. |     |     |     |     |
| -------- | ---------- | ------- | ----- | --- | --- | --- | --- |
warningfile=$spooldir/$me.warning
# Some short status info can be written to this file. For instance, the
# stresscpu test outputs something like 13/60 to this file to indicate
# time remaining.
| # Keep | the content | on one | line | and as short | as  | possible! |     |
| ------ | ----------- | ------ | ---- | ------------ | --- | --------- | --- |
statusfile=$spooldir/$me.status
# Since this in an endless test the framework needs a way of stopping it
# once all non-endless test in the same phase are done. It does this by
| # calling | the script         | once | more    | and passing | a "-terminate" |     | argument. |
| --------- | ------------------ | ---- | ------- | ----------- | -------------- | --- | --------- |
| if [ "$2" | == "-terminate"    |      | ]; then |             |                |     |           |
| blog      | "$me: terminating" |      |         |             |                |     |           |

112 BurningNodes
| # remove | the lock | file | the | main loop | is checking | for |     |
| -------- | -------- | ---- | --- | --------- | ----------- | --- | --- |
rm $spooldir/$me/running
| blog "$me: | waiting   | for  | $me               | to stop" |     |     |     |
| ---------- | --------- | ---- | ----------------- | -------- | --- | --- | --- |
| # wait     | for the   | main | loop to           | die      |     |     |     |
|            |           | ‘    |                   |          | ‘   |     |     |
| while [    | -d /proc/ | cat  | $spooldir/$me/pid |          | ]   |     |     |
do
sleep 1
done
| blog "$me: | terminated" |     |     |     |     |     |     |
| ---------- | ----------- | --- | --- | --- | --- | --- | --- |
else
| blog "$me: | starting |     | test, | checking every | minute" |     |     |
| ---------- | -------- | --- | ----- | -------------- | ------- | --- | --- |
# Some scripts may require some cleanup. For instance a test might fail
| # and be                  | restarted | after | hardware | fixes.      |             |         |       |
| ------------------------- | --------- | ----- | -------- | ----------- | ----------- | ------- | ----- |
| rm -f $spooldir/$me/*.out |           |       |          | &>/dev/null |             |         |       |
| # create                  | internal  | lock  | file,    | the script  | will remove | this if | it is |
| # requested               | to        | end   |          |             |             |         |       |
touch $spooldir/$me/running
| # save  | our process                | id  |     |     |     |     |     |
| ------- | -------------------------- | --- | --- | --- | --- | --- | --- |
| echo $$ | > "$spooldir/$me/pid"      |     |     |     |     |     |     |
| while [ | -e "$spooldir/$me/running" |     |     | ]   |     |     |     |
do
run-some-check
| if [ | was_a_problem |          | ]; then   |              |            |             |     |
| ---- | ------------- | -------- | --------- | ------------ | ---------- | ----------- | --- |
| blog | "$me:         | WARNING, | something | unexpected   | happened." |             |     |
| echo | "some         | warning" | >>        | $warningfile | # note     | the append! |     |
| elif | [ failure     | ];       | then      |              |            |             |     |
’
| blog | "$me:    | Aiii,     | we re | all gonna     | die! my-test | FAILED!" |     |
| ---- | -------- | --------- | ----- | ------------- | ------------ | -------- | --- |
| echo | "Failure | message." |       | > $failedfile |              |          |     |
fi
sleep 60
done
| # This | part is          | only    | reached   | when the | test is terminating. |     |     |
| ------ | ---------------- | ------- | --------- | -------- | -------------------- | --- | --- |
| if [ ! | -e "$failedfile" |         | ];        | then     |                      |     |     |
| blog   | "$me: no         | problem | detected" |          |                      |     |     |
touch $passedfile
else
| blog | "$me: test | ended | with | a failure" |     |     |     |
| ---- | ---------- | ----- | ---- | ---------- | --- | --- | --- |
fi
fi
11.3.3 BurnFailures
Whenever the burn process fails,theoutputoftheburn log command shows the phase that has failed
and that the burn terminates.
Example

11.4Relocating The Burn Logs 113
| Thu ... | 2012: node001 | - burn-control: | phase 02-disks      | FAILED |     |     |
| ------- | ------------- | --------------- | ------------------- | ------ | --- | --- |
| Thu ... | 2012: node001 | - burn-control: | burn will terminate |        |     |     |
Here,burn-control,which is the parent of the disk testing process,keeps track of the tests that pass
andfail. Onfailureofatest,burn-control terminates all tests.
The node that has failed then requires intervention from the administrator in order to change state.
The node does not restart by default. The administrator should be aware that the state reported by the
node to CM Daemon remains burning at this point,eventhough it is not actually doing anything.
Tochangethestate,the burn must be stopped with the burn stopcommandincmsh. Ifthenodeis
restarted without explicitly stopping the burn,then it simply retries the phase at which it failed.
Under the burn log directory,the log of the particular test that failed for a particular node can some-
times suggest a reason for the failure. Forretries,old logs are not overwritten,but moved to a directory
withthesamename,and a number appended indicating the try number. Thus:
Example
Firsttry,andfailingat02-diskstests:
cd /var/spool/burn/48:5b:39:19:ff:b3
ls -ld 02-disks*/
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:26 02-disks |     |     |     |
| ---------- | ----------- | -------- | ----------------- | --- | --- | --- |
2ndtry,afterfailingagain:
ls -ld 02-disks*/
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:49 02-disks   |     |     |     |
| ---------- | ----------- | -------- | ------------------- | --- | --- | --- |
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:26 02-disks.1 |     |     |     |
3rdtry,afterfailingagain:
ls -ld 02-disks*/
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:59 02-disks   |     |     |     |
| ---------- | ----------- | -------- | ------------------- | --- | --- | --- |
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:49 02-disks.1 |     |     |     |
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:26 02-disks.2 |     |     |     |
| 11.4       | Relocating  | The Burn | Logs                |     |     |     |
A burn run can append substantial amounts of log data to the default burns pool at/var/spool/burn.
To avoid filling up the head node with such logs,they can be appended elsewhere.
11.4.1 Configuring The Relocation
The3-part procedure that can be followed is:
1. The BurnSpoolDir setting can be set in the CMDaemon configuration file on the head node, at
| /cm/local/apps/cmd/etc/cmd.conf. |     |     | BurnSpoolDir |               |          |               |
| -------------------------------- | --- | --- | ------------ | ------------- | -------- | ------------- |
|                                  |     |     | The          | setting tells | CMDaemon | where to look |
for burn data when the burn status is requested through cm sh.
|     | • BurnSpoolDir="/var/spool/burn" |     |     |     |     |     |
| --- | -------------------------------- | --- | --- | --- | --- | --- |
CM Daemon should be restarted after the configuration has been set. Thiscanbedonewith:
| service | cmd restart |     |     |     |     |     |
| ------- | ----------- | --- | --- | --- | --- | --- |
2. The burnSpoolHost setting, which matches the host, and burnSpoolPath setting,
which matches the location, can be changed in the node-installer configuration file
on the head node, at /cm/node-installer/scripts/node-installer.conf (for multi-
arch/multidistro configurations the path takes the form: /cm/node-installer-<distribution>-
<architecture>/scripts/node-installer.conf). These have the following values by default:

114 BurningNodes
• burnSpoolHost = master
• burnSpoolPath = /var/spool/burn
These values define the NFS-mounted spool directory.
The burnSpoolHost value should be set to the new DNS host name, or to an IP address. The
burnS pool Path value should be set to the new path for the data.
3. Part 3 of the procedure adds a new location to export the burn log. This is only relevant if the
spool directory is being relocated within the head node. If the spool is on an external fileserver,
the existing burn log export may as well be removed.
The new location can be added to the head node as a path value,from a writable filesystem export
name. The writable filesystem export name can most easily be added using Base View, via the
navigationpath:
Devices > All Devices > Head Node > Settings > Filesystem exports > + Add
Adding a new name like this is recommended, instead of just modifying the path value in an
existingFilesystem exportsname. This is because changing things back if the configuration is
done incorrectly is then easy. Bydefault,the existing Filesystem exports for the burn directory
hasthename:
• /var/spool/burn@internalnet
and has a path associated with it with a default value of:
• /var/spool/burn
When the new name is set in Filesystem exports,the associated path value can be set in agree-
ment with the values set earlier in parts1and2.
If using cm sh instead of Base View,then the change can be carried out from within the fs exports
submode. Section3.13.1of the Administrator Manual gives more detail on similar examples of how
to add such filesystem exports.
11.4.2 Testing The Relocation
To test the changes, it is wise to first try a single node with a short burn configuration. This allows
the administrator to check that install and post-install tests can access the spool directories. Otherwise
there is a risk of waiting hours for the pre-install tests to complete, only to have the burn abort on the
post-installtests. The following short burn configuration can be used:
Example
<burnconfig>
<pre-install>
<phase name="01-hwinfo">
<test name="hwinfo"/>
<test name="sleep" args="10"/>
</phase>
</pre-install>
<post-install>
<phase name="02-mprime">
<test name="mprime" args="2"/>
<test name="mce_check" endless="1"/>
<test name="kmon" endless="1"/>
</phase>
</post-install>
</burnconfig>

11.4Relocating The Burn Logs 115
To burn a single node with this configuration, the following could be run from the device mode of
cmsh:
Example
[basecm11->device]% burn start --config default-destructive --edit -n node001
This makes an editor popup containing the default burn configuration. The content can be replaced
with the short burn configuration. Saving and quitting the editor causes the node to power cycle and
startitsburn.
The example burn configuration typically completes in less than10minutesorso,dependingmostly
on how fast the node can be provisioned. It runs them prime test for about two minutes.

12
Installing And Configuring
SELinux
12.1 Introduction
Security-EnhancedLinux(SELinux)can be enabled on selected nodes. If SELinux is enabled on a stan-
dard Linux operating system,then it is typically initialized in the kernel when booting from a hard drive.
However, in the case of nodes provisioned by NVIDIA Base Command Manager, using PXE boot, the
SELinux initialization occurs at the very end of the node-installerphase.
SELinux is disabled by default because its security policies are typically customized to the needs
of the organization using it. The administrator must therefore decide on appropriate access control
securitypolicies. When creating such custom policies,special care should betaken that the cm d process
isexecutedin,ideally,anunconfinedcontext.
Before enabling SELinux on a cluster,the administrator is advised to first check that the Linux d is tri-
but ion used offers enterprise support for SELinux-enabledsystems.This is because support for SELinux
should be provided by the distribution in case of issues.
Enabling SELinux is only advised for BCM if the internal security policies of the organization ab-
solutely require it. This is because it requires custom changes from the administrator. If something is
not working right, then the effect of these custom changes on the installation must also be taken into
consideration,which can sometimes be difficult.
SELinux is partially managed by BCM and can run on the head and regular nodes. The SELinux
settings managed by CM Daemon(usingcmshorBaseView)should not be managed by directly dealing
with the node outside of CM Daemon management,as that can lead to an inconsistent knowledge of the
SELinux settings by CM Daemon.
When first configuring SELinux to run with BC Mon regular nodes,the nodes should be configured
with permissive mode to ensure that the nodes work with applications. Troubleshooting permissive
mode so that enforcing mode can be enabled is outside the scope of BCM support, unless the issue is
demonstrablyaBCM-relatedissue.
12.2 Enabling SELinux On RHEL8, Rocky 9
12.2.1 Setting SELinux Parameters
The selinux settings mode is available at node,category,orpartitionlevel.
Example
[root@basecm11 ~]# cmsh
[basecm11]% device use node001
[basecm11->device[node001]]% selinuxsettings
[basecm11->device[node001]->selinuxsettings]% show
Parameter Value

118 Installing And Configuring SELinux
-------------------------------- ------------------------------------------------
Initialize yes
Revision
| Reboot after | context          | restore no     |     |
| ------------ | ---------------- | -------------- | --- |
| Allow NFS    | home directories | yes            |     |
| Context      | action auto      | install always |     |
| Context      | action full      | install always |     |
| Context      | action nosync    | install always |     |
Mode permissive
Policy targeted
| Key value | settings | <submode> |     |
| --------- | -------- | --------- | --- |
The Mode can be set to permissive,enforcingordisabled. When starting the use of SELinux and
establishing policies,it should be set to permissive to begin with,so that troubleshooting issues to do
with running applications with enforcing mode can be examined.
The default SELinux configuration parameters are in /cm/node-installer/scripts/
node-installer.conf, and that file remains unchanged by cmsh settings changes. The values of
SELinux configuration parameters used from that file are however overridden by the corresponding
cmshsettings.
For multiarch/multidistro configurations the node-installer path in the preceding session takes
theform: /cm/node-installer-<distribution>-<architecture>/scripts/node-installer.conf. Theval-
uesfor<distribution>and<architecture>can take the values outlined on(page550oftheAdministrator
Manual).
12.2.2 Setting UpOn The Head Node
The followingprocedure can berun on bothhead nodesto configure SELinuxon Rocky 9, so that the
SELinux enforcing mode is enabled:
| [root@basecm11                                    | ~]#    | cmsh                |                    |
| ------------------------------------------------- | ------ | ------------------- | ------------------ |
| [basecm11]%                                       | device | use master          |                    |
| [basecm11->device[basecm11]]%                     |        | selinuxsettings     |                    |
| [basecm11->device[basecm11]->selinuxsettings]%    |        |                     | set mode enforcing |
| [basecm11->device*[basecm11*]->selinuxsettings*]% |        |                     | commit             |
| [basecm11->device[basecm11]->selinuxsettings]%    |        |                     | quit               |
| [root@basecm11                                    | ~]#    | touch /.autorelabel |                    |
| [root@basecm11                                    | ~]#    | reboot              |                    |
...
| [root@basecm11 | ~]# | getenforce |     |
| -------------- | --- | ---------- | --- |
Enforcing
12.2.3 Setting UpOn The Regular Nodes
A similar pattern can be repeated on the regular nodes.
Configuring The SELinux Settings
The SELinux settings can be configured at partition,category,ornodelevel.
Nodes that are to use SELinux can be placed in a category, secategory. The secategory category
can be created by cloning it from the default category that comes with a newly-installedcluster:
Example
| [root@basecm11        | ~]#      | cmsh           |       |
| --------------------- | -------- | -------------- | ----- |
| [basecm11]%           | category |                |       |
| [basecm11->category]% |          | list           |       |
| Name (key)            |          | Software image | Nodes |

12.2Enabling SELinux On RHEL8,Rocky9 119
| ------------------------ |     | ------------------------ |             | -------- |     |     |
| ------------------------ | --- | ------------------------ | ----------- | -------- | --- | --- |
| default                  |     | default-image            |             | 4        |     |     |
| [basecm11->category]%    |     | clone default            | secategory; | commit   |     |     |
The SELinux settings can then be configured for the newly-clonedcategory.
Example
| [basecm11->category]%                              |     | use secategory; | selinuxsettings |                  |     |     |
| -------------------------------------------------- | --- | --------------- | --------------- | ---------------- | --- | --- |
| [basecm11->category[secategory]->selinuxsettings]% |     |                 |                 | keyvaluesettings |     |     |
[basecm11->category*[secategory*]->selinuxsettings*->keyvaluesettings*]% set domain_can_mmap_files 1
[basecm11->category*[secategory*]->selinuxsettings*->keyvaluesettings*]% exit
[basecm11->category*[secategory*]->selinuxsettings*]% set mode<tab><tab>
| disabled | enforcing | permissive |     |     |     |     |
| -------- | --------- | ---------- | --- | --- | --- | --- |
[basecm11->category*[secategory*]->selinuxsettings*]% set mode permissive #for now, to debug apps
| [basecm11->category*[secategory*]->selinuxsettings*]% |     |     |     |     | commit |     |
| ----------------------------------------------------- | --- | --- | --- | --- | ------ | --- |
The domain_can_mmap_files boolean setting is needed to allow SELinux policies to revalidate some
kinds of file access in memory.
Configuring The SELinux Image To Be Used
The problem with SELinux file contexts on the node when again provisioning animage: Iftheimage
that is used to provision the node still has the old file attributes,and if the provisioning mode is FULL
orAUTO(section5.4.4of the Administrator Manual),then image sync during node-installer provisioning
results in reverting the SELinux file contexts that have been setup on the running node back to the old
state.
Thus, for FULL or AUTO provisioning modes, if default-image has no SELinux file security con-
texts,then the SELinux file security contexts vanish after the node comes backup after are boot.
Creating a new image and using setfiles to set up SELinux file contexts on the new image: One
good way to have anode come up with SELinux file contexts,is to setup the image that is provisioned
so that the image has the contexts already.
This can be configured by first cloning the image,with:
Example
| [basecm11->category[secategory]->selinuxsettings]% |     |      |     | softwareimage |         |       |
| -------------------------------------------------- | --- | ---- | --- | ------------- | ------- | ----- |
| [basecm11->softwareimage]%                         |     | list |     |               |         |       |
| Name (key)                                         |     | Path |     | Kernel        | version | Nodes |
-------------------- ----------------------------- ----------------------------- --------
default-image /cm/images/default-image 5.14.0-284.11.1.el9_2.x86_64 5
| [basecm11->softwareimage]% |     | clone | default-image | selinux-image; | commit |     |
| -------------------------- | --- | ----- | ------------- | -------------- | ------ | --- |
...
...[notice] basecm11: Initial ramdisk for image selinux-image was generated successfully
Then,afterselinux-image has been generated,the contexts can be setup in the new image with the
SELinux set files command,usingthe-r option to set the root path:
Example
| [basecm11->softwareimage]% |     | quit                                 |     |     |     |     |
| -------------------------- | --- | ------------------------------------ | --- | --- | --- | --- |
| [root@basecm11             | ~]# | setfiles -r /cm/images/selinux-image |     |     | \   |     |
/etc/selinux/targeted/contexts/files/file_contexts /cm/images/selinux-image/
| [root@basecm11 | ~]# | setfiles -r /cm/images/selinux-image |     |     | \   |     |
| -------------- | --- | ------------------------------------ | --- | --- | --- | --- |
/etc/selinux/targeted/contexts/files/file_contexts.local /cm/images/selinux-image/
If the image is updated in the future with new packages,ornewfiles,then the set files commands
in the preceding example must be run again to set the file contexts.

120 Installing And Configuring SELinux
Organizing the nodes and setting them up with the newly-created SELinux image: Nodes in the
category can be listed with:
| [basecm11->category[secategory]]% | listnodes |     |
| --------------------------------- | --------- | --- |
...lists the nodes in that category...
Nodes can be placed in the category from device mode. For example, node001, node002, and
node003canbeconfiguredwith:
| [basecm11->category[secategory]]% | device |     |
| --------------------------------- | ------ | --- |
[basecm11->device]% foreach -n node001..node003 (set category secategory)
If the nodes in the category se category are to run filesystems with SELinux file contexts,thenthe
image generated for this earlier on,selinux-image,can be committed to that category with:
Example
| [basecm11->category[secategory]]%   | set softwareimage | selinux-image |
| ----------------------------------- | ----------------- | ------------- |
| [basecm11->category*[secategory*]]% | commit            |               |
Booting The Image For SELinux On The Regular Node
The category can then be re booted to check that all is working correctly.
Example
| [basecm11->category[secategory]]% | device reboot | -c secategory |
| --------------------------------- | ------------- | ------------- |
Reboot in progress for: node001..node003
...
...reboottakesplace...
| [basecm11->category[secategory]]% | !ssh node001 | "getenforce" |
| --------------------------------- | ------------ | ------------ |
Permissive
| [basecm11->category[secategory]]% | !ssh node001    | "ls -Z" |
| --------------------------------- | --------------- | ------- |
| system_u:object_r:admin_home_t:s0 | original-ks.cfg |         |
| system_u:object_r:admin_home_t:s0 | rpmbuild        |         |

A
| Other | Licenses, | Subscriptions, |
| ----- | --------- | -------------- |
Or Support Vendors
NVIDIA Base Command Manager comes with enough software to allow it to work with no additional
commercial requirements other than its own. However,BC M integrates with some other products that
have their own separate commercial requirements. The following table lists commercial software that
requires a separate license,subscription,orsupportvendor,and an associated URL where more in for-
mationcanbefound.
| Software | URL |     |
| -------- | --- | --- |
Workloadmanagers
| PBSProfessional | http://www.altair.com            |     |
| --------------- | -------------------------------- | --- |
| MOAB            | http://www.adaptivecomputing.com |     |
LSF http://www.ibm.com/systems/platformcomputing/products/lsf/
| GE  | http://www.altair.com |     |
| --- | --------------------- | --- |
Distributions
| Suse   | http://www.suse.com   |     |
| ------ | --------------------- | --- |
| RedHat | http://www.redhat.com |     |
Compilers
| Intel | https://software.intel.com/en-us/intel-sdp-home |     |
| ----- | ----------------------------------------------- | --- |
Miscellaneous
| AmazonAWS | http://aws.amazon.com |     |
| --------- | --------------------- | --- |

B
Hardware Recommendations
The hardware suggestions in section3.1are for a minimal cluster,and are inadequate for larger clusters.
Forlargerclusters,hardware suggestions and examples are given in this section.
The memory used depends significantly on CM Daemon,which is the main NVIDIA Base Command
Manager service component,and on the number of processes running on the head node or regular node.
The number of processes mostly depends on the number of metrics and health checks that are run.
Hard drive storage mostly depends on the number of metrics and health checks that are managed
byCMDaemon.
B.1 Heuristics For Requirements
Normal system processes run on the head and regular node if the cluster manager is not running,and
take up their own RAM and drive space.
B.1.1 Heuristics For Requirements For A Regular Node
A calculation of typical regular node requirements can be made as follows:
RegularNodeDiskSize
For disked nodes, a disk size of around 25 GB is the minimum needed. 256GB should always be fine
at the time of writing of this section (October 2023). The disk size should be large enough to hold the
entire regular node image that the head node supplies to it,which typically is around6GB,alongwith
swap,log files and other local overhead for the jobs that will run on the regular node.
Regular Node Memory Size
The total RAM required is roughly the sum of:
RAMusedfornon−BCMsystemprocesses+50MB+(numberofnodes×10kB).
B.1.2 Heuristics For Requirements For AHead Node
A calculation of typical head node requirements can be made as follows:
HeadNodeDiskSize
The disk size required is roughly the sum of:
space needed by operating system without cluster manager + 5GB per regular node image +
(100kB×number of metrics and health checks×numberofdevices)
A device means any item seen as a device by CMDaemon. A list of devices can be seen by cmsh
under its device mode. Examples of devices are: regular nodes, cloud nodes, switches, head nodes,
GPUunits,andPDUs.

124 Hardware Recommendations
HeadNodeMemorySize
The total RAM required is roughly the sum of:
RAM used for normal system process+100MB+(numberofnodes×1.8MB)
This assumes less than 100 metrics and health checks are being measured, which is a default for
systems that are just head nodes and regular nodes.Beyondthefirst100metrics and health checks,each
further100extratakeabout1MBextraperdevice.
B.2 Observed Head Node Resources Use, And Suggested Specification
B.2.1 Observed Head Node Example CM Daemon And MySQL Resources Use
CMDaemon and MySQL have the following approximate default resource usage on the head node as
the number of nodes increases:
Numberofnodes CMDaemon+MySQLRAM/GB CMDaemonRAM/GB DiskUse/GB
1000 16 2 10
2000 32 4 20
5000 64 10 50
B.2.2 Suggested Head Node Specification For Clusters Beyond1000Nodes
For clusters with more than1000nodes,ahead node is recommended with atleast the following spec i-
fications:
• 24cores
• 128GBRAM
• 512GBSSD
The extra RAM is useful for caching the filesystem,so scrimping on it makes little sense.
Handy for speedy retrievals is to place the monitoring data files,which are by default located under
/var/spool/cmd/monitoring/,onanSSD.
A dedicated /var or /var/lib/mysql partition for clusters with greater than 2500 nodes is also a
goodidea.

C
BCM And NVIDIA AI
Enterprise
Some features of BCM are certified for NVIDIA AI Enterprise (https://docs.nvidia.com/
ai-enterprise/index.html).
C.1 Certified Features Of BCM For NVIDIA AI Enterprise
The BC M Feature Matrix at:
https://service.bcm.nvidia.com/feature-matrix/
has a completelist of the features of BC M that are certified for NVIDIA A I Enterprise.
C.2 NVIDIA AI Enterprise Compatible Servers
BC M must be deployed on NVIDIA A I Enterprise compatible servers.
The NVIDIA Qualified System Catalog at:
https://www.nvidia.com/en-us/data-center/data-center-gpus/qualified-system-catalog/
displays a completelist of NVIDIA A I Enterprise compatible servers if the NVA IE Compatibleoption
isselected.
C.3 NVIDIA Software Versions Supported
NVIDIA A I Enterprise supports specific versions of NVIDIA software,including
• NVIDIAdrivers
• NVIDIAcontainers
• the NVIDIA Container Toolkit
• the NVIDIA GPU Operator
• the NVIDIA Network Operator
The NVIDIA A I Enterprise Catalog On NGC at:
https://catalog.ngc.nvidia.com/enterprise
lists the specific versions of software included in a release.

126 BC M And NVIDIA A I Enterprise
| C.4 NVIDIA | AI Enterprise | Product Support | Matrix |
| ---------- | ------------- | --------------- | ------ |
The NVIDIA A I Enterprise Product Support Matrix at:
https://docs.nvidia.com/ai-enterprise/latest/product-support-matrix/index.html
lists the platforms that are supported.

D
NVIDIA BCM Scope Of Support
D.1 Included In BCM Support
NVIDIA Base Command Manager (BCM) technical support has a standard scope of coverage that in-
cludesthefollowing:
D.1.1 Support For Cluster Installation
The BC M support team will help install BC Mona supported Linux base distribution,usinganyofthe
documented BC M features.
If the add-on installation method is used (as opposed to the bare-metal installation method), then
installation on top of a default minimal installation of the base Linux distribution is supported.Adefault
minimal installation of the Linux base distribution means selecting a minimal set of packages during the
installation and leaving all settings at their defaults.
D.1.2 Support For Cluster Configuration
The BCM support team can help create configurations to meet the specific needs of a customer using
any of the documented BC M features.
IfSecurity-EnhancedLinux(SELinux)is enabled on the head node or compute nodes and a problem
arises, then a customer may be asked to demonstrate that the problem also exists when SELinux is
disabled,in order to confirm that the problem is not caused by an SELinux policy configuration.
D.1.3 Support For Integration Of Cluster In Site Infrastructure
Site infrastructures vary greatly,and so support is not provided for the third-party hardware and soft-
ware that maybe involved. Nevertheless,the BC M support team will do its best to provide support on
matters related to cluster integration within a site’sinfrastructure.
Information on how to accomplish many integration tasks is provided in the BC M product manuals
and knowledge base, and is often all that is needed to get the job done. If not, then the BCM support
team may be able to help. The BCM support team will ask that the customer demonstrate how to
accomplish the aspect of integration on an ordinary machine running the same Linux distribution as
the cluster. Once the BCM support team has that information, it can provide instructions on how to
accomplish the same task using BC M.
D.1.4 Support For Integration With Microsoft Active Directory
NVIDIA provides documentation that describe show to integrate the BC M cluster with Active Directory;
however,that integration requires help from the Windows Server administrators. It is the responsibility
of the BC M administrator to communicate with the Windows Server administrators to get the required
information for the chosen integration method.
Debugging Active Directory integration issues is beyond the scope of standard support.

128 NVIDIA BC M Scope Of Support
D.1.5 SupportForFirst-PartyHardwareOnly
The BCM support team does not provide support for third-party hardware issues. When it is unclear
whether an issue is due to hardware or software problems, the BCM support team will work with a
customer to determine the source of the problem.
D.1.6 Support For Software Upgrades
Supported customers receive access to all new software releases, and the BC M support team manages
any issues that arise as a result of an upgrade.
To identify versions of its software, BCM uses pairs of numbers (e.g., 8.0 or 9.2). The first number
denotes the major version of the software and the second number denotes the minor version.
An upgrade within the major version(e.g., from9.1to9.2)is called a minor upgrade. Anupgrade
from one major version to the next(e.g.,from8.2to9.0)is called a major upgrade.
Minor upgrades and recent major upgrades can be done in place.The BC M support team will enable
smooth transitions during software upgrades.
D.2 Excluded From BCM Support
Support coverage for BC M excludes the following:
D.2.1 HelpWithThird-PartySoftware
Third-party software is all software not developed by NVIDIA,eventhough it maybe packaged or in te-
gratedwithBCM.Examplesinclude,but may not be limited to,theLinuxkernel,all software belonging
to the Linux base distribution(e.g.,RedHat),OpenMPI,ScaleMP,and workload management systems
suchasSlurm,SGE,LSF,Torque,PBSPro,andUGE.
An exception will be made if a customer demonstrates that NVIDIA packaged an application in cor-
rectly,or if the customer demonstrates that the integration in the stock user environment is incorrect.
D.2.2 Help With User Applications
No support can be provided on issues related to compiling or running user applications, i.e., applica-
t ions that are not packaged as part of BC M and which are installed on to a cluster by a customer or other
individual.
If a customer suspects the issue relates to an NVIDIA product, then the problem must be demon-
st rated using a small application that will allow NVIDIA engineers to reproduce the problem.
D.2.3 Help With Workload Management
No support will be provided on issues relating to the workload management system.Theonlyexception
is during the initial installation and configuration and in cases where a customer demonstrates that an
issue is caused by incorrect integration between BC M and the workload manager.
D.2.4 Help With Performance Issues
No support will be provided to trace performance issues in the cluster. The only exceptions are per for-
man ce issues related to software components developed by NVIDIA.
D.2.5 Root-CauseAnalysis
The NVIDIA support engineers will do their best to determine the cause of a failure,butcannotguaran-
teeth at all issues can be traced down to a root cause.
D.2.6 PhoneSupport
Phone support is not provided by the BC M support team. This is because support via a written ticket
system is generally more efficient, as it usually allows better tracking, more precision in conveying

D.3Support Outside Of The Standard Scope—Getting Professional Services 129
meaning,easier information gathering,and a more optimal saving of information for later internal ref-
e rence and search queries.
D.3 Support Outside Of The Standard Scope—Getting Professional Services
Support for items outside of the standard scope are considered professional services.
The BC M support team normally differentiates between
• regularsupport(customer has a question or problem that requires an answer or resolution),and
• professional services (customer asks for the team to do something or asks the team to provide
someservice).
Professional services outside of the standard scope of support can be purchased via the NVIDIA
Enterprise Services page at:
https://www.nvidia.com/en-us/support/enterprise/services/