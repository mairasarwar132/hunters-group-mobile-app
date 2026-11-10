# Hunters Group Flutter App - Screenshots

This directory contains reference filenames for app screenshots to be captured during submission verification. 
**Do not create or overwrite actual image files here.** These filenames are naming references only; 
actual screenshots should be captured from the running application and saved with these exact names.

## Filename Mapping

| Filename | App Screen | Description |
|----------|------------|-------------|
| `01-home-screen.png` | Home Screen | The main/home screen of the Hunters Group application, showing featured benefits, team section, and navigation options. |
| `02-about-screen.png` | About Screen | The about screen displaying team member information, team grid layout, and organizational details. |
| `03-services-screen.png` | Services Screen | The services screen showing available services/cards with benefit information and feature descriptions. |
| `04-contact-screen.png` | Contact Screen | The contact screen with the WhatsApp integration flow and contact form interface. |
| `05-navigation-menu.png` | Navigation Menu | The application navigation menu/bar showing available sections (Home, About, Services, Contact). |

## Capture Guidelines

- **Light Mode:** Capture each screen in light theme.
- **Dark Mode:** Optionally capture each screen in dark theme for comprehensive coverage.
- **Resolution:** Preferred width 360px (matching the verification requirement), height as needed for full content visibility.
- **No UI Chrome:** Ensure status bar and navigation bar are visible or consistent across captures.
- **File Format:** PNG format recommended.

## Workflow

1. Run the Flutter application on a device/emulator at 360px width.
2. Navigate to each screen listed above.
3. Capture screenshots using the device's native screenshot functionality.
4. Save each screenshot with the exact filename listed above (`01-home-screen.png`, etc.) in this `screenshots/` directory.
5. Verify each screenshot displays correctly without RenderFlex overflow issues, proper team member display, and correct WhatsApp integration flow.

## Verification Checklist (per screen)

- [ ] No RenderFlow overflow stripes
- [ ] Team members display correctly with names and roles
- [ ] WhatsApp integration functional (for contact screen)
- [ ] Navigation menu accessible and functional
- [ ] Light mode and dark mode appearances captured