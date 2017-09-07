---
title: 'Merging tabSRMM + chat.dll -  an idea'
date: 2006-03-12T15:02:10+00:00
modified: 2006-03-12T15:02:10+00:00
author: Admin
layout: topics
tag: first
excerpt: >
  Now, with IRC + chat plugins being basically umaintained, I'm thinking again about an idea we had quite some time ago - to create the "ultimate" message window plugin which offers an unified user interface for all chat sessions in Miranda.
---
{% include content/tabsrmm_warning.md %}

# Merge TabsSRMM + Chat.dll
  
  Now, with IRC + chat being basically umaintained, I'm thinking again about an idea we had quite some time ago - to create the "ultimate" message window plugin which offers an unified user interface for all chat sessions in Miranda.

<p style="text-align: justify;">
  To achieve this, we would need to merge parts of chat.dll into tabSRMM. This would have the following advantages:
</p>

  * unified user interface - chatrooms like IRC channels and/or MSN group chats could co-exist with normal chat sessions within the same container. For MSN group chats, this should make it possible to "morph" a 1:1 chat session into a multichat when someone joins - no need to switch to a new window - the current tab will just change its behaviour from a single chat session to a multichat room
  * it would save some code. Such a merged tabsrmm+chat would be more effective than two independent plugins (a single plugin with, say, 500k size is better than 2 separate plugins with 250k each).
  * it would guarantee that the chat.dll part will be maintained in the future (as long as I work on tabSRMM). So bugs could be fixed, and a few new features could be added (personally, I think that chat.dll is fairly complete and does not need much new features - IEView support might be one of the more important ones).
  * better usability - unified icons in all chat sessions, synchronized hotkeys, the same "look and feel" for both normal and multi chat sessions.
  * the flexibility of the tabSRMM container system would, of course, allow you to organize your chat sessions better than you currently can - you could put IRC channels in a different container or even sort them by IRC network and so on.

<p style="text-align: justify;">
  Of course, everything comes at a cost. A +disadvantage+ would be that tabSRMM will grow by, at least, 200k in size. But like I already said, it is better to have a single plugin with a size of 500k than 2 plugins with 250k each - each plugin adds additional overhead (especially when miranda starts) and merging the 2 plugins may also eliminate some code and resources (icons etc.).
</p>

<p style="text-align: justify;">
  <strong>So, what do you think. Comments are welcome</strong>. This is currently only a mental eperiment :) No code has yet been written.
</p>