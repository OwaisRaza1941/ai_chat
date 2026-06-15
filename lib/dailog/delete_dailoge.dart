import 'package:flutter/material.dart';

Future<void> showDeleteChatDialog({
  required BuildContext context,
  required VoidCallback onDeleteForMe,
  VoidCallback?
  onDeleteForEveryone, // null rakhna ho to "Delete for everyone" hide ho jayega
}) async {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  await showDialog<void>(
    context: context,
    barrierDismissible: true, // bahar tap se band ho jayega
    builder: (ctx) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 280),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: isDark ? Colors.red[300] : Colors.red[600],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Delete chat?',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                // Message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'This will delete the chat from your device.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(
                        0.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Optional "Delete media" checkbox (WhatsApp style)
                _DeleteMediaCheckbox(),

                SizedBox(height: 8),
                Divider(height: 1),

                // Actions: Cancel / Delete for me
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          onDeleteForMe();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red[600],
                        ),
                        child: Text('Delete for me'),
                      ),
                    ),
                  ],
                ),

                // Optional "Delete for everyone"
                if (onDeleteForEveryone != null) ...[
                  const Divider(height: 1),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        onDeleteForEveryone();
                      },
                      icon: Icon(Icons.report_gmailerrorred_outlined),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red[700],
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      label: Text('Delete for everyone'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Stateful checkbox widget to mimic WhatsApp's "Also delete media" option
class _DeleteMediaCheckbox extends StatefulWidget {
  const _DeleteMediaCheckbox();

  @override
  State<_DeleteMediaCheckbox> createState() => _DeleteMediaCheckboxState();
}

class _DeleteMediaCheckboxState extends State<_DeleteMediaCheckbox> {
  bool _alsoDeleteMedia = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _alsoDeleteMedia,
      onChanged: (v) => setState(() => _alsoDeleteMedia = v ?? false),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Also delete media in this chat'),
      subtitle: Text(
        'Media will be removed from your device',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
        ),
      ),
    );
  }
}
